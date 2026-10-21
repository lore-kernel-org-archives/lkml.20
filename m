Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579996;
	b=y7eyt3yEzx41uFIfkUbsig5cifQDG907sHocjGU1x86h+rTmZm2xgj7iUWdki3VtU6bW
	 oOIuPQgxCF8ThcPTosuO2AVUz78BBv8mUhlBf6ntmf9+TDGChnq9sHhK2HmQLpW+EkvtH
	 OE6ePlUZBi4tEHwt7ILiKUrKbitdT74VEf+2JKDU39v1vOt0RBs7iYzEPkG879RJv54kD
	 BUhxbDj7VIbssOf7tlwvJpfr1WWbj30jIBuAF6cI9WOfRaLdo4bDPpMTmMu6CpoRLadJh
	 ktuQ8LQjPaBgLeezgyBU7EZ2ioXkHxILjFOoPLugfHm6JZmD4AJHmAhcKteu+QYB3qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579996;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aYDzqg6x8BQI1Egimv3K7Xzdi+oL1XYI1sfD8JuEwm4=;
	b=1sQfx8MMZf8yLkyTSGUZTui3WpLLM+Dm+2hskhEMGJkafY+mmUZgjwJKM+bXQUYF1kzr
	 e1gJyBhYaLV9B/ja7TXxHMxZ7gavp7qXveSR5SQLugrMx/Ak4P4rxDEkhIXkOco95tvDk
	 cYlA5Ey23harcm2gOq5was8+U3X4J0vpv6DG0EcVmEqj1ePpS+OOFvWT0fBZbGCNVkiFZ
	 dV5bIm85T+VsXf4l+OsIEIsrhIs+zVQ8eGyfF35KslhxHr9Q7JfT604xUX89lIpHdBQ2j
	 4d1/Sb368psu+63DBKVyFAJv9+0KWNNXLnr7Zui8Xmv8Mu+CKph9s4bXP14imzOlQaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ajBPg4on;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JEv8RxVp;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C9606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D44C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ajBPg4on;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JEv8RxVp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792579994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aYDzqg6x8BQI1Egimv3K7Xzdi+oL1XYI1sfD8JuEwm4=;
	b=ajBPg4on3lvjYsrwa4at7VFGv0NQ01tiDiz9UB6e+2DXaSlN4uIKy3DhSExzQwuCdhzXv8
	VBiDqHa7QrRGlZAqfElRGgd3Uo3EUGP/PGg39odgmTdLzY/rG6T21C0iWyjCw4DxglW5MD
	5NDGqnRYCwpZzlg+/ADo6hfnPSZzA9Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-SJ4OXnXGOPWfuonuCdPvng-1; Wed, 21 Oct 2026 10:53:11 +0000
X-MC-Unique: SJ4OXnXGOPWfuonuCdPvng-1
X-Mimecast-MFC-AGG-ID: SJ4OXnXGOPWfuonuCdPvng_1792579990
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48df02b91f9so1084190f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792579990; x=1793184790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYDzqg6x8BQI1Egimv3K7Xzdi+oL1XYI1sfD8JuEwm4=;
        b=JEv8RxVpaPCjRqSIcUjHMxL65vtID/PVPPMcb98limxi91V1OnkwVODwRTrs+uRuML
         yOuMvlQXROmZMvJDrQCYeYiScsGk1Kq9guPqNvwaVPbrySuLK9/TkOCp30DkUQYz4m0e
         3lBDwukofARNf75jbrhoHywLDkqtM4CMBKgDdw8IBHhjqpYNqgTx24yAzjDB4epIb7Uq
         it0qmeMxvDBzR4jqIr2arZV07BazENvVL+QqvpcRJHdkr4GqXBPJIo8KDTuTckSuYvLr
         vTbBGRIyN/Sp1lhSSp6EuullFyc6kZkq1y/RIL3JI0g9MhkaFdqa96Prz1fG6f0HbQ+E
         LpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579990; x=1793184790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYDzqg6x8BQI1Egimv3K7Xzdi+oL1XYI1sfD8JuEwm4=;
        b=IzEeW98mRw9pJFUQ2K0AQT9/9Vntle/Am/qtT5vtc0JOUO4tUEcz52iQoGvbvLagRH
         f6ek4YltUeFxn1UkScQ1UkcBBHwTLikWihgF3mOEHkSZXB5CkOP1VLd4mdYTy0Xus4/G
         igo+Ax+Zk3GratJUSyg+tz0NoBKzGwfSf4dHvO0V2eoCF6nH5FhrOeKpX8HQhzlfP2jQ
         u5RLO75LZiLefhV7T07uiQuMtKx8Xzeij4FVoqZUHfJqL4wAeLnuJbegTOGr5dxO6Olm
         47Etl/4aNHa64+sbkHatSwJKNqAp8ort5LE2iSl4BIlzhBS604/HRnXk1PBPNT2U4zAH
         MnLg==
X-Forwarded-Encrypted: i=1; AKwUvBz4b/jV6EfjOYUgH38E2NCHSV6AUCql9FWZbzD8SEInWQ6pe7bDGM4rmQRUny7MQJTLMPq0n0tozGK2TzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5DdsYW70/BVx3LxghIUxYrg+06Jwi/VDpd9wfFpeKCTRqmnPe
	DInGo/vPsYUAnsmcPCbrPWeZM3TFoyARBIkL7iNAJr0aoU7uN0Yt/sHcH3UJCwSl78IaLwVN8SP
	u5xY4CqlFXL6catmfX5Unc8S6oDSfJnBzFfl37nsgeMtBAhPt6ttoJjKCXqO3ik1Njw==
X-Gm-Gg: AYBFou3XOY+6vMzVa0js2EYOblcj+qdqtziZ2m2YuHDnIJSkr+86lr0oqCq4MxLkYyD
	V2pUDT4bfy6SXvlrqRgmLT3GjEL7jjEUBHfT2ox8hOumv7fV3U4hPi9PKClEqB61o234yO3kx8I
	cMyMFnHqFwofN/r/hDPREPpZlKSGUrpWkZ8Pi+MW2vQfRfIJ2LaxcjCD84amOMGT+xgMWy8962N
	N/34kWccF2/iScyXbSh+oNcPohaN074l9zBtvgFSIvsO4uBmyeRCA2gVn1+806DF8BlET+wuwkz
	+Ruku1ekMC894FYFotZxKuLdmwYYA6wSM51hbiThmcO66BrWpu1mLePknsoDVZ/LicUSvC6yHSG
	pQ9looB0qmEFX1jJRUhlcStoD4WXTmOuPEbtcQLQa3UrUMFY4r5RYFy4trTZQug9LVLCGAdgHIg
	==
X-Received: by 2002:a5d:5e86:0:b0:48e:adc:b97d with SMTP id ffacd0b85a97d-48e1e7a7a2emr10981524f8f.8.1792579990239;
        Wed, 21 Oct 2026 03:53:10 -0700 (PDT)
X-Received: by 2002:a5d:5e86:0:b0:48e:adc:b97d with SMTP id ffacd0b85a97d-48e1e7a7a2emr10981478f8f.8.1792579989684;
        Wed, 21 Oct 2026 03:53:09 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254efb2csm4985120f8f.2.2026.10.21.03.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:53:09 -0700 (PDT)
Message-ID: <ef23d9b7-33c1-40dd-854e-1911ad3534a4@redhat.com>
Date: Wed, 21 Oct 2026 12:53:07 +0200
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
Subject: Re: [PATCH net v2] tcp: reject devmem tx with fastopen and repair
To: Kaifeng Wang <kaifengw@google.com>, netdev@vger.kernel.org,
 Eric Dumazet <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net,
 kuba@kernel.org, horms@kernel.org, asml.silence@gmail.com,
 almasrymina@google.com, willemb@google.com, kaiyuanz@google.com,
 sdf@fomichev.me, linux-kernel@vger.kernel.org
References: <20261019174522.55644-1-kaifengw@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261019174522.55644-1-kaifengw@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Adding Eric (for real) and Kuniyuki

On 10/19/26 19:45, Kaifeng Wang wrote:
> tcp_sendmsg_locked() enforces that devmem TX can only proceed if the
> zero-copy path is active and a valid dmabuf binding exists. However,
> subsequent branches in tcp_sendmsg_locked() can still intercept the
> message before it reaches the devmem zero-copy loop:
> 
> 1. TCP Fast Open (MSG_FASTOPEN or DEFER_CONNECT):
>     If TCP_FASTOPEN_CONNECT is set, the socket may have a valid dst with
>     NETIF_F_SG (so zc == MSG_ZEROCOPY and binding is present), but
>     tcp_sendmsg_fastopen() -> tcp_send_syn_data() will use
>     copy_page_from_iter() to byte-copy from the iterator. Since iov_base
>     represents dma-buf offsets rather than user virtual addresses, this
>     misinterprets offsets as user pointers and copies the caller's memory
>     at those addresses into the SYN packet.
> 
> 2. TCP repair mode:
>     If tp->repair is enabled with TCP_RECV_QUEUE, tcp_send_rcvq() similarly
>     calls skb_copy_datagram_from_iter(), byte-copying from the iterator.
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
>    branches directly, also covering the case where tp->repair is enabled
>    while sk_stream_wait_connect() drops the socket lock.
> - Drop the !sockc_err gate from the devmem validation check and return
>    sockc_err if set, preventing a valid SCM_DEVMEM_DMABUF followed by a
>    failing cmsg from bypassing the check.
> 
>   net/ipv4/tcp.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> index 87ef6d5cbfeb..2792923f0748 100644
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@ -1169,14 +1169,18 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>   			zc = MSG_SPLICE_PAGES;
>   	}
>   
> -	if (!sockc_err && sockc.dmabuf_id && (zc != MSG_ZEROCOPY || !binding)) {
> -		err = -EINVAL;
> +	if (sockc.dmabuf_id && (zc != MSG_ZEROCOPY || !binding)) {
> +		err = sockc_err ?: -EINVAL;
>   		goto out_err;
>   	}
>   
>   	if (unlikely(flags & MSG_FASTOPEN ||
>   		     inet_test_bit(DEFER_CONNECT, sk)) &&
>   	    !tp->repair) {
> +		if (binding) {
> +			err = -EINVAL;
> +			goto out_err;
> +		}
>   		err = tcp_sendmsg_fastopen(sk, msg, &copied_syn, size, uarg);
>   		if (err == -EINPROGRESS && copied_syn > 0)
>   			goto out;
> @@ -1200,6 +1204,10 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
>   	}
>   
>   	if (unlikely(tp->repair)) {
> +		if (binding) {
> +			err = -EINVAL;
> +			goto out_err;
> +		}
>   		if (tp->repair_queue == TCP_RECV_QUEUE) {
>   			copied = tcp_send_rcvq(sk, msg, size);
>   			goto out_nopush;

The ever increasing number of conditionals is a bit concerning, but
I don't see how to avoid the new ones.

/P

