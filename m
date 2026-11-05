Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901356;
	b=zUWM1okYCcaS5yiOvuRitPlmH1qXqiEtbhg3Ey/hoEkBQ/VrwWj1++HtNl+fdu7JxpzB
	 zDh99BTvpaepGC4Knkbn0M9Wic8BJzHXzVJJgGA23Yt73P/uqvPonKuI/G7VQzS7Ng6FR
	 eFYMI3HALXh/8ZFG8MuotMGJo4wMqZxosnCi4+8FPwguC2iwJpWwX7mE7n24NtT/GSexe
	 O/DjJR+G3iyacE+MKHErdTkGIP/MdhK2F7aYETeQiogW0f/udQkZzMoZ87nEwZThwSzVO
	 N/gknztu8r8yK5fS/CJ2AzJKuBmQW/OCTiy1xUzzN9CpRajVnIbGUe1HmzA+k8flVAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KJPkIDOAYDK93RB/9c0VDv3wKCD+7XkZXq4Nusu/JJ0=;
	b=0/3H6IwJVKTeakehfzu4CfMNTf6Tw3CULinzO2f9yyavFKruNpD+8d7rjh8jWFDgTycD
	 FhNNB02Ozvi3A+uvz9e8XBLGLJbf+xBbv2R4NJh1puEPnrT5f1lLkPQjz0LyAnYlej0E9
	 bSABqnLFaNTYyfHb0FqX7DBSKGsILkOJaLiMthtzg2NKxGbO+ZH+JtF/hMcQmQ9ejaK6m
	 09c2Gcc0ybNza329J6NiHXsg/aeJPlnEgPYPHmy+O0kBTr5u03F2haBsQUJKDJq72fw0Z
	 0x52MymTvPnO1kMhbDlgvFtgHnbRFw6CQNTQaI4QkBduq1NkO0wn/1EWduf7RxqSeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1kTwUwv;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D9606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043D9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N1kTwUwv
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9e2dfb29so280538eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901355; x=1794506155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KJPkIDOAYDK93RB/9c0VDv3wKCD+7XkZXq4Nusu/JJ0=;
        b=N1kTwUwvpB9XGiNqY3oRRDkzMFpGtl/3/7auXAzY2if4gWRYBUHuPntVBU4+TUujkG
         W7jJELMjM/8dRVIN8nB3i2Rq/SIHnr6VLrFzvLb7rxQHGkwUoZZY33BfAt41D5M89+jH
         hxgRIA2vm1sRoXNbc5lwnZBzfH/NSIr0NAITPAVv7u5S7aeArsy8IefaR/+uMyx3XMBq
         mLyXgvolIQ8QbxRTvlRYD2RpHFWsFLg502wzz0gs2+mflVzlv1OyU2xJSxhpqsRql6JQ
         lzH3vQurUPNHdCD4wqRjKVppVCXRrwDctcJyqVt8TV+Bp7zj6pzbUE4ZfVvOb1N06HOI
         0JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901355; x=1794506155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KJPkIDOAYDK93RB/9c0VDv3wKCD+7XkZXq4Nusu/JJ0=;
        b=N3koqz/sDEumkj76v4YcU3UnjFDakeoJbYjZPGFn47+GCdxIRC/CuIxo1U6aIT3SFf
         6cd7k6Bf+3RhyM93ENyMbYIhtVZCt5ozcIO3OTBOE307Td3AfFapYqz55bcVWjDCFdcF
         8JgXvdM9g71w8LZbRyYzw3h0u319rMCqqQ5hubfAwLeVr/2fLR6uB7ShjyiMyDMJpi8b
         1Oq72bZzkObww8W4USSV23Lm8g3GuFW/qED2AWa8FhSSrvqMA8W9JkWWOewtrvo/Nbm9
         VBZEXcRkklXdIyOaPJAqs06+CJYLLvuIPsw9AatdW7pljdMMkUUEIP+yRWFemSKa9KZP
         9r1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQIuBcwKNp81zccv/S9udY9yNBKn2q3/vt/7HaDo9I+c2Sb5FfCG9u1LVj7yet49LN+h4WcoZvAqox7yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oo41SHl0GjBNWFfRFUYlBtJURnjbFqhZLlxoi2KQqVfx6x7br
	2SIPgQrjD4XcVjOf9/QO1QB2aEFWbOtBJ6jgu/2ZOw/Sq9bMH07A15yO
X-Gm-Gg: AYBFou1Vixb0ruMV31lQs6xtOB5CBQiSiqJuvtEm4Wz/MntKQT1Ibc/GLoSiWc6e9n2
	vhjIDkmTAGbV/dEcPsdVsXPLjBFMjkxjb29L44r0vC1r0SWFhsCLOOd1Veus1nlbyqoAIBrr8oj
	8N5DYA3D/GlFjoI4YM5tjAWXp+IE5ciMxIXHClpJ3Vro28CaYTWDxQoS+IESqvWf7Y795JSnGxM
	WGLzhwyrCoo9zB03ycVfLU1q9IoJ+l5m4OAZq1JwLt+OguwjZCgFbkM1rZTh7XiwMoq8QBIwiGm
	NiJoH80K2sha4AVuTqifyd8j/9NqcFw1hmT3iU1FCxQ5kxwrEq7qJiSy6mlEQALB0Ip7l0qAG7E
	w0yNkOU65k58EvgJbIurJXbw+OQGPmULnIh2iYEse3wSsFIfL3MKcBlFX5KK6Xm8ygrynhn1i8F
	XW8s1zOwEc2pJm7oyFpu64ZYI/xrlZkag34hTaqhMEiXZMs6JhPH6KbMcXooe5TB+1gXIPDzieN
	29nVb17L/A+fOGhDmKV/3j94qauQCjqPjarCacdtgnw7bhF9VmtDkGISJVdGBbknBYs1VQcNqA6
	ekVsMbIbh2vuW3kiIYOn5A==
X-Received: by 2002:a05:7023:a5c:10b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b24f460f1dmr4221448c88.18.1793901354912;
        Thu, 05 Nov 2026 09:55:54 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:65::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm18947609c88.1.2026.11.05.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:55:54 -0800 (PST)
Date: Thu, 5 Nov 2026 09:53:41 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, razor@blackwall.org, 
	daniel@iogearbox.net, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/7] net: devmem: add a per-device netmem TX
 frag size limit
Message-ID: <auzCRJidvMSIOcKc@devvm16445.scu0.facebook.com>
References: <20261103235152.1904727-1-sdf@fomichev.me>
 <20261103235152.1904727-5-sdf@fomichev.me>
 <18e4e1daa184cadc.3137322e32382e36372e3935.ceab9.0000sendgmr@google.com>
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
In-Reply-To: <18e4e1daa184cadc.3137322e32382e36372e3935.ceab9.0000sendgmr@google.com>

On 11/04, Mina Almasry wrote:
> On Tue, Nov 3, 2026 at 3:51 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > Devmem TX frags are bounded only by the net_iov size, which is about
> > to grow up to 2MB, more than some devices can describe in a single TX
> > descriptor.
> >
> > Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> > frags to the limit of the device the binding is attached to.
> >
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  Documentation/networking/net_cachelines/net_device.rst | 1 +
> >  Documentation/networking/netmem.rst                    | 6 ++++++
> >  include/linux/netdevice.h                              | 2 ++
> >  net/core/datagram.c                                    | 1 +
> >  net/core/dev.c                                         | 1 +
> >  net/core/devmem.c                                      | 1 +
> >  net/core/devmem.h                                      | 1 +
> >  7 files changed, 13 insertions(+)
> >
> ...
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 3ac700d37e59..ba2f887dcd39 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -12350,6 +12350,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
> >         dev->gro_ipv4_max_size = GRO_LEGACY_MAX_SIZE;
> >         dev->tso_max_size = TSO_LEGACY_MAX_SIZE;
> >         dev->tso_max_segs = TSO_MAX_SEGS;
> > +       dev->netmem_tx_max_frag_size = U32_MAX;
> 
> I wonder if netmem_tx_max_frag_size should default to PAGE_SIZE instead
> of U32_MAX, and have drivers opt in by raising it after verification
> (e.g. SZ_32K for bnxt and U32_MAX for mlx5 in this series)?
> 
> With U32_MAX as the default, large frags are enabled on all NETMEM_TX
> drivers unless they opt out. For example, fbnic also has a 16-bit TX
> descriptor length (FBNIC_TWD_LEN_MASK) and only avoids hitting
> dma_error here because its tso_max_size happens to be 64KB today, and
> gve hasn't been tested with >PAGE_SIZE devmem TX frags yet. Defaulting
> to PAGE_SIZE (similar to tso_max_size = TSO_LEGACY_MAX_SIZE above) seems
> safer for existing and future drivers.

Hmm, I did not see fbnic :-/ That sounds fair, let me switch to an opt in,
should be safer, agreed... Will only option mlx/bnxt and most likely fbnic.
