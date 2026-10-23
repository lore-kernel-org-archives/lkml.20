Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797876;
	b=VqdmjJyxWocRLsp6CYLJ/yX6wRchr4M0RGdou4T4amfDN4NSv9gIHeQp4nAw3XVSX2NB
	 f8jlskA6e0Gv6jqg1jXKhLAwp4UagGtw+t4osTCoy4t4eE4Bzp04rAmZcfe4Vdlgw74Bq
	 +pH6WC1JW4mCcCvwleOtRuB1a9h/6M8I4D8D+RNfOLhTXT9OXcejXTMXokIZKSmfcB1Pj
	 MG+4+1NZkoIuP38uBJDKhKZ7LURWbBMRFB8NrEhpt3ixKIIsfNYn559YIlwHfCykvigGv
	 5gk30bMKkyP/ByjWpXsXi44mhiyuI2XgQXL+bSP7nN8RlV2/ZSpdUgDsUOwvv7vRq2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Message-ID:In-Reply-To:References:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=qctrEjDPRvksa3AQ4KXVPQGZIrVdTyfkgfyBHLBiYsg=;
	b=InotlcgQnuKstCu9fWeYAFEqCDh7FIKHBrRdXhglrmkrcnMFUqYqo5rrZqeIlZaCbPCD
	 HaYNxgmHoTBa5hrzWvalsMkdyIQjpnl2oHOjal1qLSt0i7mQOp79sfxLdUuZ5DhDGtHFk
	 1TMeFsIG5Klq3k7HeZ3ppK1IN9ESCLwiC4QUxMzLa7g05fa7KaVKPJpfXqNxS+L1IFhcK
	 ZGoen4XYWGg70bEkMsKlbvOoRtshkBsBJWVK86cdUMbzT3zOi18x59Gqxu+5sN64oN16N
	 sz+CQgGLTxXkoNEerzXly9TxT8xvFJbakcEAhauJrlMz/HAxsmuB1PhP81Yw1hNYE5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GXwK61Sc;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC509606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC509606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GXwK61Sc
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eadea8f0edso753440e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792797875; x=1793402675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qctrEjDPRvksa3AQ4KXVPQGZIrVdTyfkgfyBHLBiYsg=;
        b=GXwK61SctjOOsjiufYWVOfoV93GiISGLiAKK/sikeLtakMu37g19i4wX5g8DVndbD/
         VGlGUTKtfmg3r2tBS4KMsgcEZRxlwLQTLnvQ0U20ZUWSvBeo2b/S2rD0EFlAovXmV4kh
         9dMGBgE2kNZf++/aLQZFGu5fYzy7wurS2hBBmFncuc5to98Dr7XEcDuD1TPa09Vr+upn
         j9XpbY9G+hNWVIEpcg2qUsnrB+sVgfsfBfn/sBw14EieDr7G2MFLqOKH7yd8YrDgksX8
         EEueQOY7RmiMuN22ihgdSkcofcScEJarwicP3iKEqHu2wrVdtzOphJWU+8q7GqlexZz4
         fCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797875; x=1793402675;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qctrEjDPRvksa3AQ4KXVPQGZIrVdTyfkgfyBHLBiYsg=;
        b=HROdpdihUijtcBPjD+khV9hnlfIWiug+oVlpUmUHTk4loEWOuFTxpl4bTdbUQY9hV/
         +RGUNH2ijAyklo2V/S5Ilp0IulXF73p8CIk7afpQsRLMcPRj8F8USE2Isw7ImJuzYUcC
         MhY5XPA+fSOQauj73CcUojUh8XytR90oP35r2Tes3OQmeCdKc37HIZLjiTsPg+lXfSfp
         KzEQn0AlBhEtZ/1nrYeEsxs49nLOzmX83vJCjikJMRqhbhMyUW3eFN7VZ/hHHgRwotRh
         AXWVoE+v70Ctji+zq4Tz3Yo3Adjlnw721IAiT/C71Sj0U1LGPo+hpqMhL+6iixUA8DiA
         AjRg==
X-Forwarded-Encrypted: i=1; AKwUvByYSUqA6jQClL91/q7V2eEOGhRtzsYCzQ1xw2Pd6GkuzQIAS8JCwgs8CyQC8EhWrngqJ2/nL0hGUEJ4cSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhD9Y8nSi+SLudbwB/urzGovHZycY/eGYssQMU2P55Rkdek29Q
	ZsaPXpd5rbgZlr5IUl0YM2p/VuvrWh77M3M8DYEX3XeCQfPbLCQX/2uh
X-Gm-Gg: AYBFou2GIvMzSlynRXU7yhLz/qN68h7GQUbcI9vd4CRX+dvWDbKaV2d51PzKzN/Cmh1
	IaM8rMgcf+zs9s+I4f5Ib9xgzabau8vcrUkItGJonm5ja5DInX9marvxwNOZeBF6aEXGxpdtsE/
	OgFBFPiWwARMryxGP/BwolWSJvIZPys/Iws+g6GHr7nvgkZ6bdYbf+r8Y9yegpCVSbiOX6obIUs
	l0sbAXurn80NOeJjmQj3EazkCyYlNrt4uX3/hekRr7eujw6pWt1gejInIMEH/ZcIfSHJ9ESzQhv
	33lB8fnIv+fAE8lw+HAzVRJ0T/KNmYcuPhK+vJHndhq4WeNwk5KZvZIrTd9o2rd/ilgK6elnHsw
	lQFKW85STv/0L4TQnaBqi432SWysaGOs59PYPRCxNvy44IluGqhmVUKFTss9Wpd2F4cz0tWsRwC
	JitE1dYnovikkcACOpUtcClzHGVahecnvOW3uI7Op2O93KS1ntIQiNAjnow6VZbZQH903o2p3rD
	WrOGrjN0kNyX9CSKDeiyH3N/nFPmrxOsLjVaZzTBsywtZpWh7sBFsw6wW55kCdJgsNIif6Pqd3x
	V3DQzTnmIyFE4qcdWlwGfdxDM7oWbx7wJdfDcsrDTpZeCAHdx6lI2zp+rAt90Tz/ZzW1MOY51AK
	Mmv3eiLuQGQAWlCNIScsqCQls6Ow49Ip1Vkwrl7Ty
X-Received: by 2002:a05:6122:2091:b0:5e9:6d96:a7cc with SMTP id 71dfb90a1353d-5ec235e8039mr93235e0c.9.1792797874653;
        Fri, 23 Oct 2026 16:24:34 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec232757bfsm466976e0c.2.2026.10.23.16.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:24:34 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:24:33 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Cheng Yongkang <teel4res@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Petar Penkov <peterpenkov96@gmail.com>
Message-ID: <willemdebruijn.kernel.2ec6aa9785f36@gmail.com>
In-Reply-To: <179268538303.70821.16548460883330758972@gmail.com>
References: <179268538303.70821.16548460883330758972@gmail.com>
Subject: Re: [PATCH net] net: tun: hold napi_mutex when deleting NAPI in
 tun_detach_all()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Cheng Yongkang wrote:
> With IFF_NAPI_FRAGS, tun_get_user() takes tfile->napi_mutex, gets the
> skb from napi_get_frags() and copies the user data into it before it
> enters the RCU read-side section around napi_gro_frags().
> 
> tun_detach_all() waits with synchronize_net() and then calls
> tun_napi_del() without napi_mutex.  netif_napi_del() frees napi->skb
> through napi_free_frags().  A writer that is still copying has not yet
> entered its RCU section, so synchronize_net() does not wait for it, and
> deleting the device frees the skb while the writer is using it:
> 
>   BUG: KASAN: slab-use-after-free in skb_copy_datagram_from_iter+0x175/0x720
>   Read of size 8 at addr ffff888077def990 by task br029-poc/9406
>   Call Trace:
>    skb_copy_datagram_from_iter+0x175/0x720
>    tun_get_user+0xb42/0x3d00
>    tun_chr_write_iter+0x113/0x200
>   ...
>   Freed by task 9405:
>    kmem_cache_free+0x184/0x670
>    __netif_napi_del_locked+0x2bb/0x3c0
>    tun_net_uninit+0x566/0xa70
>    unregister_netdevice_many_notify+0x1a26/0x2090
>    rtnl_dellink+0x514/0x710
> 
> __tun_detach() also calls tun_napi_del() without the mutex, but only
> from tun_chr_close(), when no write on that file can be in flight.
> 
> Take napi_mutex around tun_napi_del() in tun_detach_all() for both
> attached and disabled queues.
> 
> Fixes: 90e33d459407 ("tun: enable napi_gro_frags() for TUN/TAP driver")
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
