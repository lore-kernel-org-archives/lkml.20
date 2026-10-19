Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453176;
	b=OW7KqvPBWKi+dYk2F/Ki8Q8f8HH3rboyhdhaP388V6Gzj1X9Uag1SmXY1IlqAaZ4PGDz
	 VpS3BfYLRXxUhmEh0MedR9RZVJbcqYkwHedStO2yj7f9cqh9ADEehTOGxplCbZuP1NIND
	 +8AOVfrsZHtJ7c/LcyJl6b4oUIkEzQqxIPovnIZcH9QHAg1KzbNEC3sVz9Q0rpa1UFuPb
	 bIFpb6+jpDSrMYgqiQNshm6VmZxtMO3vB8S6j51WGSyrFanYnEld9PcC93NkROyIYnM8M
	 9FyPkqwj8Q2pp66EF9tSKUsE/eeTZet6pKdVqOOZ2rIZ/a3Jo+1JrsI/gap4jAe2r3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A2XMj0MgDNNeDg+EibWO9ZwK+CGK7oGBq9Z2sZ3Ezdk=;
	b=wOCE4SD0nQNRF8o0+Zj1SYJ/nYxi4Jz7qpNj++loJrNhFeutggnOgrbtjX+rFtDNhrtX
	 SN41kmRbIkQIg/QDx94oA+msz1L5i2gbgN4mS378t8iJ9xbIx1CK6+Amr0OR8bho1l2FD
	 aLiJDRNPKpdfVIvbTPETyX1G2EQmJvS+CcoV+mNprLyynQGPmuHnyVsj6PNo8x93iAlrG
	 MOQ4XTndU2GGnAaiUc/0iHHCpwkF+GNavn8CCnngGg/EVX96nyoAIElLqciDk3rqhN7mk
	 nBS0w0G0vn44oKi+sY9q9yIqpjBy5tshjnDVFsKmaDJ8TrlVuE7IkCJOxKhbxSrhAlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="W/jkav5Y";
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919B8606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 919B8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W/jkav5Y
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eadef147ffso13718e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792453174; x=1793057974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A2XMj0MgDNNeDg+EibWO9ZwK+CGK7oGBq9Z2sZ3Ezdk=;
        b=W/jkav5YZc5EOPkPBBpxqdU5uCjHa4Y+S5njK0UKinhmusxH5MMhec6fJH6ygzYLxx
         fY8KM50uL8eDcIZO/g1NUls00c63vvjL5FSCxj0nB68usyIfI4HD1740A7e0rPpSYf43
         C9++Ou3pcBXiBBdFhu8Mpl0HwqbCsuzJEgdT1T3Tc1Q4ZGiZDkdJ/DX6pZZ8+I8SEP9h
         SqpDK623YkIefr8eQ5aJ04OKYefVpjM5OFGgjOcRz7CSHj6Tt2MdGf48R9Y2m4DpDso7
         58WXRkfJXug4VZTc4Awmc4p7MH90MjQxuSsyjXV7erxSKFshOF0TCoxJObRk0+x428ZY
         PxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453174; x=1793057974;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2XMj0MgDNNeDg+EibWO9ZwK+CGK7oGBq9Z2sZ3Ezdk=;
        b=t7ZE0adm6MN4DNFNEwbklS9vL6qmVjGloA5Kg023gp4iZHhHacvN2ehPwNBlPZyopr
         rWZdUs5th/vwUZaAJVFfLGf+GHxMfqZnM8QZRxaJGatCRiQpdAq4CR+DyRg1wl90rT20
         oEDeZfgd9KtECmUBCypY9/AqQSsxDfSdPtJnQANBo7BgY+KDHO0Dx+ZoJq9zjTBlLTok
         KzEjifvWaDOyoC+0YytPC25uWZQlHjEiQ++xOWjyG0AVoxuyvL9AH321WkyPg26tVGVf
         tM/oY2Cbz/RlcdJZsx91I20YuASsp2ta7x7fWs63c7KAJ0CZ4ae2wgTrgx3N8Fr8t8IE
         Uh8A==
X-Forwarded-Encrypted: i=1; AKwUvByNTdLgZF0SVcxGnlE/DAU8J/GD4dMo8vGRy7LErWx/mLFME3K9rnEfcOOw6DX0BrGar1xwyRTJMwnwjck=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIotzDNp0Ii5+hsmefehmg6+JQUFTWdAaBkpU2QYYqK9dcFB1J
	xowRc0uFwVf+uZlun1c8CZv3/7yl787Ef6mwAJWfLgYoUq39oUysT1KQ
X-Gm-Gg: AYBFou1Gm078YiQQuBWUQpKL0UBXF5qZ1YwCjcUjxyhpMTK/EUF0YKZjF9eKDVA98t4
	rzdVR6bR3ApyEy6dvKPKM2guLjhjufTKU0aaKpixmavPuO9UbCmaPEKwopM7ch1nGTgvJ41iekR
	2POnzxvge1fT+vlGUYj7OarKdXg1N0wcruoOySXNVsGYsKoMFbmF2l8yMrTagUMyeIjCWCI3HFG
	yhbjJ79+WUkw/DXlXQqhQ1XRI7hGLJ/O0jMiuN+fk755PnMgbcvhczJObc6e/GiJVO8hQE+aKjo
	G7FqbWGhwMx88eVVHR3cyispxT4h4nDSaRwzm4vlumF7qY2luKYkqIza1Cw29hPTE3UGIJ+zSbF
	+ykuy7ElaXVmivCGknnRRmJxJFilhHKiUhMVpxwts3Muing6H4bJBMA3GXbOy0DxxrMzsV9SQYS
	fEChf8qWCafi3s9DHgVstBrEEVgCzz19QyggMfY26ykpAPC9TdIwt9tDShoT+QgFyygk4/0yehI
	xTTAIn3mE+w83pEGqFsgi0akFsLkyfvGSs17JKnfvUMZHd+BlyffkUu4kV7sHzajXoET24nlZQF
	LjQbxNEkWvIsjgCczcEwN6tlzW6ZLdfmBNO7Uw==
X-Received: by 2002:a05:6123:107:b0:5ea:cd69:7cda with SMTP id 71dfb90a1353d-5eacd697dc2mr1189183e0c.7.1792453174590;
        Mon, 19 Oct 2026 16:39:34 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eac2c68171sm5412215e0c.8.2026.10.19.16.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:39:33 -0700 (PDT)
Date: Mon, 19 Oct 2026 19:39:33 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Josh Don <joshdon@google.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Josh Don <joshdon@google.com>
Message-ID: <willemdebruijn.kernel.ab2d1293d97d@gmail.com>
In-Reply-To: <20261019230758.2960779-1-joshdon@google.com>
References: <20261019230758.2960779-1-joshdon@google.com>
Subject: Re: [PATCH] udp: Add noinline_for_tracing annotation for
 udp{,_v6}_send_skb()
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

Josh Don wrote:
> We hook udp_send_skb() and udp_v6_send_skb() using BPF fentry programs
> to monitor UDP transmits. Both functions are static and have two
> callers: udp{,v6}_sendmsg() and udp{,_v6}_push_pending_frames().
> 
> After an FDO profile update, udp_v6_send_skb() is now inlined into
> udpv6_sendmsg(), while an out-of-line copy remains for
> udp_v6_push_pending_frames(). The fentry program still attaches
> successfully, but it is silently bypassed for all uncorked sends.
> 
> To address this, make both functions noinline explicitly for tracing,
> as was done for tcp_drop_reason() in commit dbd5e2e79ed8 ("net: tcp:
> Add noinline_for_tracing annotation for tcp_drop_reason()").
> 
> Assisted-by: LLM
> Signed-off-by: Josh Don <joshdon@google.com>

This would target [PATCH net-next]. But that is closed:

    https://netdev.bots.linux.dev/net-next.html

Please resubmit when the window opens.

The entire function is quite large (though the common hot path would
not be). For that, I expect adding the noinline will be okay.

> ---
>  net/ipv4/udp.c | 4 ++--
>  net/ipv6/udp.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index b090bd1f59e86..487c8cc8ab206 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -1110,8 +1110,8 @@ void udp_set_csum(bool nocheck, struct sk_buff *skb,
>  }
>  EXPORT_SYMBOL(udp_set_csum);
>  
> -static int udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4,
> -			struct inet_cork *cork)
> +noinline_for_tracing static int
> +udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4, struct inet_cork *cork)
>  {
>  	struct sock *sk = skb->sk;
>  	int offset, len, datalen;
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index 93478d1ad5769..fe92538835176 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -1366,8 +1366,8 @@ static void udp6_hwcsum_outgoing(struct sock *sk, struct sk_buff *skb,
>   *	Sending
>   */
>  
> -static int udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6,
> -			   struct inet_cork *cork)
> +noinline_for_tracing static int
> +udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6, struct inet_cork *cork)
>  {
>  	struct sock *sk = skb->sk;
>  	int offset, len, datalen;
> -- 
> 2.56.0.212.g129ede20d9-goog
> 


