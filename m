Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827553;
	b=px8/jpkvgAlZaAhfqCQ1kKQDlSZWiJ3mUkUgRCrJd0179TG9eDhXUWugMZFJOgXggPpV
	 kZH3gc5Zbry77UAwMWnfxmuA78H/8vFCaPsLHCuFCr9dVlOAwBT0SpuPQKW0PAJrb1RaL
	 6HNxN0cQRtRDx1fi767qimTKTgrZ2K0kdr0RZLq2bYMxerU59lSXCJONHLo0EWnDrLRIb
	 KZ9CeSIucvjsaM13P48CVS9Kr6hm3Gl4ZFd1IS+UcTCVVXP8qhDQ2QM3UeUzEIYSCovbP
	 2FXJUBpV6DBfVO4EiH6jZU1kSvwDgsZJYzAx7PPaMEeMTf2CtH8u4O98ME0D4MlJjUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827553;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ehUjsofQYEve6ndzO97sRzCTIUWyobwDpskP54c542Q=;
	b=1RWlYiQDa4w+kkeKVRticxSPbTmLrlRpbuHkGMPZgEjqWEJDPePpN2Tk7iqBF2XhQE8f
	 0oJNUgUYJcBOTKSz+mz1dB/lP6GhCb+wVXNp71qVYzl3DK/e5f17zfWFUTRXtQlfn9d/t
	 8df6i4xim7zYhA5cExkX20lU3PvyjvWPzyLTl5tWji9WHRBWD7KeD3cAEt07UFSJsQBeZ
	 NyhLP+G2up29aNdBw1BMVqEm6F70W/b6WPCQ9K8gfKdy19OblW6btoB2yv0AkLew8VfA1
	 Pm7tC7MjjzPJkswOyDY+4bP7tPjGsY5+sJBcgUB5iKTJSnG1XDEbg0/c8jx5/rcls6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E4Cuw+Ej;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=X2vml9es;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E57606C5BD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E57606C5BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E4Cuw+Ej;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=X2vml9es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793827552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehUjsofQYEve6ndzO97sRzCTIUWyobwDpskP54c542Q=;
	b=E4Cuw+EjjHtBBgzh/y1qW7fNKMTBW5npRubLltaU7WG54/0CFclD89uQouEyN7CsBrTUon
	fU/SKrbTYbxQdSt6EBMo4bWkA90wPx8PsfWJnNl4kwYMUkJskWGkztimbe/hQOY/rFQDUR
	NPsmaR6Ks61WBOxjBO6h3VaU32gAEQQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-FtsCD7lAPHuN_G4ZMZGUbg-1; Wed, 04 Nov 2026 16:25:51 -0500
X-MC-Unique: FtsCD7lAPHuN_G4ZMZGUbg-1
X-Mimecast-MFC-AGG-ID: FtsCD7lAPHuN_G4ZMZGUbg_1793827550
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0461e040so1073403f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793827550; x=1794432350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehUjsofQYEve6ndzO97sRzCTIUWyobwDpskP54c542Q=;
        b=X2vml9esjC3ryJ8DwKfNMDQLVcSUFaZZtftcnS5ShWrp1M5xyxTQd27t2fdNrKmRPN
         Yv49mTDynfJKH/BjtOFC5OtHION31m9nRGb7K8ZFzMcYhutIKxF1/gAO0pVQVu+DeL5U
         WUOM2Sgc4TQlq4/A5/e0ohmmqrmnQtWnuuKZ6aAQnKrZ00U0M8BAujJnOQLZdRffM2rM
         EE/4ZAvU7MmozKylTWGQIJEkI/WbMEy22jtVEtOC7b5sF6fD86hYseanv4e/eBFQMnad
         75x3FEoRUU3cJtoVsV/7IMyZ7J6LgmCw0SqPf06FR8ykT+ZFVpMElK4gk0NZH7HNaUIZ
         pfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827550; x=1794432350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehUjsofQYEve6ndzO97sRzCTIUWyobwDpskP54c542Q=;
        b=gxXrjx2XgHxoCFz2zdzvqIEEm+VsPbRKlpBa/B8QhYuqstvxtkaW77l7SQRHD04mKQ
         6F29GPhGCdLWupQaqiEC93IQl9kUkCn7mX973fcQVrRfWu351rweawEPvJPGMQs3gGL0
         0SaPHOXYCfWi8nZos3/86d3iVV8W20bPexcFUDhzjgEwUkYWpYkGd8Zi65oFqD+0QR+t
         CQ0Cp7vfpv6cGYJJ9eHETd+v3IJ3ZZIsdlc10uVuKX2RsB6KuXKs44jR3JfADHjFt2Up
         3qsfJwvqZu42V7hiv/rzoIfYtxpFCR11QC85PkKeERS8gSFP8prr0nDIXNxzRpIE8DxQ
         IFFg==
X-Forwarded-Encrypted: i=1; AKwUvBzyLJFdq2uay1G0wFwvjX3FGIVREru3Cn9I1bbRoK3KYBvI39Cc7LH1yk0K8kcejUQjJAqephtFqEp789Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e67ifqQo1CreGEUMja6/5Ek2Im4jtekc+muknzhDucDOlUn7E
	TLeLWUoyw8zUzsE1UbYpUtpHAOCDKpFJlm0bCjQiFar2HzY21jcjq/8gtgV8nukzP0dw7vMLBNX
	2HKoUMmYmcmgSeCZgJc0z+1h4hW28C1P0hcssKrXWkpH2QOnrTiCtpdf7U2EaVy5zOw==
X-Gm-Gg: AYBFou17nKUVMsQ5UR1pYZkfDubJuLdfddRA772s3UQ/Pg0jOhmCGmIsELskm9DNhLJ
	rAreAIcCavIy0TZiL/sv/TFvihFiuIkFb1+I1v7C3mCSgO0A1XWeFPLESTprCyMZV55gwe/yJuM
	q9ep0kcoO0iUflatGjZCPNfY/KFbtli5hcJsBtO/eNqFGvJ5hFOG/xXkasW1SbGLG1KE7wTGisN
	28Tmx3Z4FvdEkdj53F4UfvA5MhR5dnWO/G6I/zAmomXA6LAEljPwDt/zp4LvTkrFaYFyCj6U1yT
	HOfmN0r2mkidgXdokXkbGIHmUCXljzY1rwq/i+SpApCMnmcaHUu/L4lkBz3HT3ee6dhzx1KnfyS
	+GUg6YswDpj8NKcVP/jSffQND4rUCMioCoF4U4GwhRtdY2gjt4LFzGI6mw00iVdP7/cCCwUqdCh
	Wy24FdFn+3VCL88x1q/C7lPnbNlnSqVJhbkySKPUjUMrg=
X-Received: by 2002:a05:6000:184d:b0:48d:fbf2:555f with SMTP id ffacd0b85a97d-48e6e518487mr40091115f8f.55.1793827549852;
        Wed, 04 Nov 2026 13:25:49 -0800 (PST)
X-Received: by 2002:a05:6000:184d:b0:48d:fbf2:555f with SMTP id ffacd0b85a97d-48e6e518487mr40091084f8f.55.1793827549444;
        Wed, 04 Nov 2026 13:25:49 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm5900596f8f.41.2026.11.04.13.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:25:48 -0800 (PST)
Message-ID: <457a96dd-99dd-47f9-ae0f-cdb82e2951f9@redhat.com>
Date: Wed, 4 Nov 2026 22:25:45 +0100
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
Subject: Re: [PATCH net v5] tipc: raise the minimum bearer MTU to fit tunnel
 and crypto overhead
To: Joas Antonio dos Santos <joasantonio108@gmail.com>,
 Jon Maloy <jmaloy@redhat.com>, Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <179340438471.4412.6707287163192409104@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179340438471.4412.6707287163192409104@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/26 00:53, Joas Antonio dos Santos wrote:
> A peer can lower the link MTU to TIPC_MIN_BEARER_MTU (100 bytes, plus
> the UDP encapsulation header) with the max_pkt field of a RESET or
> ACTIVATE message; tipc_link_proto_rcv() only checks the lower bound
> returned by tipc_bearer_min_mtu().  The same bound is applied to the
> device MTU when a bearer is enabled.
> 
> That bound predates two later reductions of the link MSS:
> 
>    tipc_link_mss() = mtu - INT_H_SIZE                    (tunnel header)
>                           - EMSG_OVERHEAD               (CONFIG_TIPC_CRYPTO)
> 
> With CONFIG_TIPC_CRYPTO=y, which is the default, an MTU of 100 gives an
> MSS of 28.  Once the link comes up, tipc_named_node_up() calls
> named_distribute(), which computes
> 
>    msg_dsz = ((tipc_node_get_mtu() - INT_H_SIZE) / ITEM_SIZE) * ITEM_SIZE;
> 
> For an MSS of 28 the subtraction is negative and the result truncates to
> 0xfffffff0; for an MSS between 40 and 59 it is 0.  named_prepare_buf()
> then allocates a buffer with no room for any item (the u32 size wraps),
> and msg_rem never reaches zero, so every cluster-scope publication on
> the node is written with publ_to_item() past the end of that one skb,
> over skb_shared_info and into adjacent memory.
> 
> Without crypto the MSS is at least 60, which still does not hold the
> first fragment built by tipc_msg_build(): INT_H_SIZE fragment header
> plus a message header of up to MAX_H_SIZE.  With pktmax below that, the
> header copies run past the pktmax bytes allocated for the fragment.
> 
> Raise TIPC_MIN_BEARER_MTU to MAX_H_SIZE + 2 * INT_H_SIZE so the MSS can
> always hold INT_H_SIZE + MAX_H_SIZE, which also leaves room for name
> table items, and add tipc_bearer_mtu_floor(), which adds EMSG_OVERHEAD
> on top for CONFIG_TIPC_CRYPTO=y.  Use it for the device MTU check
> (tipc_mtu_bad()), the UDP MTU check, the netlink MTU setting and
> tipc_bearer_min_mtu(), which also bounds the max_pkt negotiation.
> 
> Found by manual code review and reproduced with KASAN using two network
> namespaces joined by a veth pair (see below).
> 
> Fixes: fc1b6d6de220 ("tipc: introduce TIPC encryption & authentication")
> Fixes: 2320bcdae628 ("tipc: fix changeover issues due to large packet")
> Suggested-by: Tung Nguyen <tung.quang.nguyen@est.tech>
> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
For some reasons the PW bot did not notice...

Applied, thanks!

/P

