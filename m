Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515263;
	b=Y4xEnS4nDzJN72iA2w9+bem6mOYaZrkCFjdcPwXPsMNSaSJRG36++lfU6J+ClmfLE2TD
	 Cg6uwwqJycm6S8LhZACGq/zsnPku9fiOU9mKclqORunnHCx4ZZNduKbRVtX6TXtmVUf+o
	 5uSlZCRL9MkMtaNSZ05p/G/NAW4Xuf+sPdTKkikINMsmMiImn30lLxhu/AYD8PZJRV4V+
	 Td+WYIvaXO2e82RKxp5lhjTNkZwLlC1HHVyDcmDTjumZXoFzaQoYI+6iU2wky9ByBa55D
	 Y+QFmWI6vaaKzrVYABZqU/Hit5s85y9oJzEX14eo9hrwPjU6XsIMoFj8MiPDfYW5kdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=y7pJWX6mRQI0TWb4dnXe4N95Ebe0/SB4aAlZ0+60zH0=;
	b=4nXFsBQQSm6v5piYXq4PESh2/b5bneIEWxk2GeEYi70bg39AwOTiPcOeGmg1ypTx2aKA
	 wOhQy9cVsHwkAL71DJAEdUyClVdJOlEC4Veet/9ur0U/dbkqei22H4S9t3uwLqwGYi/YN
	 yguJx7MBRQEPz5ikzYqrx+LUdNUFPto3H6EoHpOZx5z8+F9LENcDvzvAtkNBCZwbIxoTa
	 tyN3TE7T1i3U2++EJ9p2Kr+ifxDh6T47dRzjfptZxvrbDx3dso9Am1uOLNkqFSNr3ucnR
	 xTDWdIJ0dKE6BI7jINGMgy0PUFo500/aCsVR/RP0hbZM+KhB0uxt4vIhc3gO46K7NRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Odl7PJRO;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77E6606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C77E6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Odl7PJRO
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df921c1d0eso13490345ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792515262; x=1793120062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7pJWX6mRQI0TWb4dnXe4N95Ebe0/SB4aAlZ0+60zH0=;
        b=Odl7PJROQh4Q61IEQ8CPcx6DqKGqhKlac1t0A9z6v5r8e9IgP5bUmSn2zR38CCYcnQ
         4Wez/O0AVyYFuJ7V7sk8Pqk5xC+5A1RwilN+EGNiLxVRsqJrd6qtOTU68u1d5vtFOJ4x
         dw7p1HOzu5Jrz6ZU34Exk9IqCCo8FhomjBimuNTRSR5QbxYwZbjnfcPlxeA6Us693U0L
         KbCTJ84aHNF7b4hCM7wjKlW9Z0CWM4Sjj/2hrhSvZVch1ekc8MhuYc9eSmXzcplS6SO9
         p1grSv3PBGRuIVbkI0zuFBt5rJASh4w2OPSHlC+cYr0i4Rqiqh3w9U7ZQ3MsOvjwyAvq
         hkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515262; x=1793120062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7pJWX6mRQI0TWb4dnXe4N95Ebe0/SB4aAlZ0+60zH0=;
        b=MXe08JKyj/DQ2xX81WS413OJniWJOe4b4OCGSRuFk4KbT083ErpBa2AEvcd52su0CE
         ln+3md0Ban5CVbKpjhuKb45CggHdnrTHEMfuFKeHOqQhwio2rJRNL/VwgR3PIp4WGM2/
         u5qaRtCB63Ob/NvNA+rBMmi/1KXctnF8xSJd8ABOtBGT5Y/UVVB3JhvaZrhS0StRaMpg
         l9BkgvIj9xVp4K3jKJMvSyajJ8QbaKVHdiHCbWHVB7p8evdUgoplZ/eFv2Phyywl+IT9
         8mAIgojYR0L/p9mL0DqcbhJ4ib3mR+6QzGZvfa1fN1ZYqCBNrdyeAa82TyqLWVhyqtIu
         u4pw==
X-Forwarded-Encrypted: i=1; AKwUvByiXhGP97A0KK31VET78hnk1c6REX6TfIVWzhVPaU+7LeO1ASWD49Erj7AI6de/PBwkAeFegTOpfuyZLok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJn30qYPjy60ZAbxhwh9kOrkZjRprAv26DFw8PJwsopPishYViF
	9DdKPSjwLShgvgzVb2qKyu6AnhmXKi2r0fEA3/YebCtp2iHOwlFxtS6y
X-Gm-Gg: AYBFou2hzZ+RQ6GawOuM93q72i2NGTJ2kEw8evIZ8/BgJm+NTUAiFKOJCKtNWuk3iWf
	HA6ibezQiBoM003bl1HCuUQJTMGWtU54Vjc3L357Rzug0xZ/G1QhDmxAgm9VF+EvKMuHXfovHtg
	Tuh4X8xeWGAzJR5yTjsDv7ivPqiLWVVInqK/Zd4nR3IO/lZsUqCWfJH/jwixuVzAp6aP6iEiOVL
	s31OCeOUHlvy4UgZj3N/B7mu0Rkp/ZiZehhHrsLAzprHRT3xPf7+80ZbWtUosXguCqYVawXJhus
	7RqGyzMpgtXA7FBCVW2YnYd9rUvMQlzWbjI/JOAoVPJHGsa2AjVprgOpeJ1ZY4PnDtEPH7BDhno
	BQbrKHCtawpFbu+oJ2d5Cu3ye0NLXKMV4tVBG0vz661LVTGtR8HE0VPQTqx8U+Q2ihdmzOoAUsZ
	QzZGLS2xOwZSAdMmv7jSqv2HlX8ZtY4huT1913DZkNS/JqpmT3KteoQUxbeqGeYt6W
X-Received: by 2002:a17:902:cec2:b0:2e8:3190:73a with SMTP id d9443c01a7336-2e9a7151518mr100280005ad.58.1792515262067;
        Tue, 20 Oct 2026 09:54:22 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b308afasm1724805ad.4.2026.10.20.09.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:54:21 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:54:16 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Kaifeng Wang <kaifengw@google.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com, 
	kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, asml.silence@gmail.com, almasrymina@google.com, 
	willemb@google.com, kaiyuanz@google.com, sdf@fomichev.me, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] tcp: reject devmem tx with fastopen and repair
Message-ID: <atecrKwmLG4aYsSB@devvm7509.cco0.facebook.com>
References: <20261019174522.55644-1-kaifengw@google.com>
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
In-Reply-To: <20261019174522.55644-1-kaifengw@google.com>

On 10/19, Kaifeng Wang wrote:
> tcp_sendmsg_locked() enforces that devmem TX can only proceed if the
> zero-copy path is active and a valid dmabuf binding exists. However,
> subsequent branches in tcp_sendmsg_locked() can still intercept the
> message before it reaches the devmem zero-copy loop:
> 
> 1. TCP Fast Open (MSG_FASTOPEN or DEFER_CONNECT):
>    If TCP_FASTOPEN_CONNECT is set, the socket may have a valid dst with
>    NETIF_F_SG (so zc == MSG_ZEROCOPY and binding is present), but
>    tcp_sendmsg_fastopen() -> tcp_send_syn_data() will use
>    copy_page_from_iter() to byte-copy from the iterator. Since iov_base
>    represents dma-buf offsets rather than user virtual addresses, this
>    misinterprets offsets as user pointers and copies the caller's memory
>    at those addresses into the SYN packet.
> 
> 2. TCP repair mode:
>    If tp->repair is enabled with TCP_RECV_QUEUE, tcp_send_rcvq() similarly
>    calls skb_copy_datagram_from_iter(), byte-copying from the iterator.
> 
> Neither path supports or makes sense for devmem transmission. Reject
> devmem sends inside the Fast Open and TCP repair branches when a devmem
> binding is present. Checking inside the tp->repair branch also covers
> the case where repair mode is enabled while sk_stream_wait_connect()
> drops the socket lock.
> 
> Additionally, drop the !sockc_err gate from the devmem validation check
> and return sockc_err if set. Otherwise, if a valid SCM_DEVMEM_DMABUF is
> followed by a failing cmsg, sockc.dmabuf_id remains set while binding is
> not acquired, allowing the Fast Open and TCP_RECV_QUEUE repair paths to
> proceed and return before sockc_err is checked.
> 
> This pre-existing issue was identified by Sashiko AI review on commit
> 125755776bc6 ("tcp: reject non zerocopy devmem tx") and has not been
> hit in production.
> 
> Fixes: 125755776bc6 ("tcp: reject non zerocopy devmem tx")
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Signed-off-by: Kaifeng Wang <kaifengw@google.com>
> ---
> v1 -> v2:
> - Move the devmem rejection checks into the Fast Open and TCP repair
>   branches directly, also covering the case where tp->repair is enabled
>   while sk_stream_wait_connect() drops the socket lock.
> - Drop the !sockc_err gate from the devmem validation check and return
>   sockc_err if set, preventing a valid SCM_DEVMEM_DMABUF followed by a
>   failing cmsg from bypassing the check.

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
