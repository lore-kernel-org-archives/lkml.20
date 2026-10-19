Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EE34F649A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417097; cv=none; b=PGFRBrV5oMeoHabkYESe/EDKTW1NrZUvC0YQV4e/VpmSgGtHM/VeogTLR7iKwY4ltjSWR2elUqIhKKnPRr13NIhdKCKIdWW4DVOTGN0dvdmJSUrcZhVmlM/5trcNIIKR1I39LWTSAIJgvj9rEma3VcxhwBHTEd87RUd4qu2cM5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417097; c=relaxed/simple;
	bh=mWHEiduWCdoe6oHOOZuNhdfgFF0aV6NZSx6eqvqdovQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bP8EYNTlU4uf4xPPlUBoi1YmzSu7ECq2PfEOZSa/4vurSfmnMZPtpolg3YXWe9tqhPtlOvRibBPmo8Gp5ltnmesIgoTNyqMHxrhXuMU4EEtQHWUki3VYyXCv1t2HrF7SBgEx5WL57OYAL1LGpC8PDWaMgpKrEs/xpvlmF0umaLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF0pp6sL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF0pp6sL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4395d31228so152951866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792417094; x=1793021894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UH5Ra2iLtsN9dIdCSOuhdt13W7AxYmxe3vEMuRCu76o=;
        b=JF0pp6sLLnIguaazsiO+D8KHOn2VSyhx3XQp9L/8CxwIBorhcD7hJ5msByWjr32d1r
         CBvAm1F8tU/FcL/VGbXul5epCiHxk3nr1WOdaZL66xycPHGOdsOlWB/OWj4yqb+GIqwG
         77VLVIFiwRTpCp0+xTt0UaNgn6dL3NZbFkDDvy6GNhei30COhknJTu+FiRYaG1s7YRFA
         9XnG1FVKopyXS3DzL1rG0T33ay3Orzr90KwXgJhb38QFAxvevbvEEPZRVJrYK7Lvd6+X
         0b697rjFYdCPSXHkONOBAFIZd+l8U+AjxD3n+AkSMYsBTUvRPD7/ORBSIAIS/kyEX7UQ
         K7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417094; x=1793021894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH5Ra2iLtsN9dIdCSOuhdt13W7AxYmxe3vEMuRCu76o=;
        b=y4rDErGYO01+3Auhni8Q54Wwy8CJJElyR4gpqrWlu5EOv2VkMyPr+pX53uQmobEE5k
         EH9TwQKOtvCDJGUJhX+td/TX0doAD1bX7n67P3Co3CCESMsp8LQILqOpvRUxHW8FwUN2
         0/5tyAT6Q9fRp0zrfthIKj1T6ai6YpdWmKcZ4i/WCRGlDyjD84si0g7aDAU5+ilSvKg3
         S2EKpYenW0tmNWLdfYDGrwMOtADBiPjSTXJvBODb8uOa9KGeNZnS9Z2g/rCKSpMTzfky
         BVKxGzYLtH1stzouKtqvUqqGa7W7fIZfJdrzvpZaUUkpON0qX2L2ZRDfAck1foAWGx7Q
         r2tQ==
X-Forwarded-Encrypted: i=1; AKwUvByIE9LXY7uDI4qfGNLNTZOwPi8KMmH6z7sphziybJM5wwAU5IigcdUTuG04Vzo7TYqlEUgTsqTNsQA02ZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY9gAb49Kuv76K1W31ocMTGhGT+nLx/LUyH5dIRmEphutj/VJT
	H+F5W/tqzftvbRW4oB1gIBY2YD9J0YNDfwN1LjLCIanMT4pbxMDGRgiw
X-Gm-Gg: AYBFou07fT+F/MONat6sQSsNat7d+VZO2Y3F/8+3tNAX1IUJ0mk7D4QNsIcevKlknL2
	dWn3F98YHWD0Z4i/WNKWAJmhmU3kbCNtzLV3RrjApY8R5DKI/la36B+cSyHpVZv4GoHWmT+DNEl
	Dkbs/uWrUc89F3X/6o+LUF/9r3PQ7Z26emWTnkw6QP2qOhB1PuMkrFXFWx39nitZbFGsLZvBAr8
	cCakwWESiiBw77b1I4BCYhFVlfPtZNcY2bRxa3aYY20qO2VevhFc7b4q74T/BYqRtIISkujUndE
	ZPKd3IRzByt5gn2G+TzgGh8qx8DEoaJIjlMoa5647UNXA9bHDbbc6iJlT7kUFJj5dBcAnpdBfkO
	rTWuCdBi1+fyyKlwonXLxoHEzqjw6TZwxGWNTqmEAcgrodqBxXnIU3i/W+EpZ/vjSCJAxYfRXDD
	0j2SGoBsrx4Btp4NS82undos11GPDSz+hQ2e530GcftswASQksQ7U1/oWJw+QVmTr/tjOw3mb5w
	jWQxALOYNtFMl25ZVYws+4rHUpKlmQNq0UVEZbGgB9b05YF/4nnviSLN8nX
X-Received: by 2002:a17:907:d86:b0:c2e:49b4:ab8b with SMTP id a640c23a62f3a-c419e0388d0mr490983266b.8.1792417093328;
        Mon, 19 Oct 2026 06:38:13 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm23131553f8f.46.2026.10.19.06.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:38:11 -0700 (PDT)
Message-ID: <e6e5a292-0512-47d0-964b-249ff35074ac@gmail.com>
Date: Mon, 19 Oct 2026 14:38:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: sfc: run hardware-classified UDP packets through GRO
To: manpacket@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-net-drivers@amd.com,
 linux-kernel@vger.kernel.org
References: <20261018-sfc-gro-udp-v1-1-f7bf378178f8@gmail.com>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20261018-sfc-gro-udp-v1-1-f7bf378178f8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2026 22:05, Michael Baikov via B4 Relay wrote:
> From: Michael Baikov <manpacket@gmail.com>
> 
> This commit partially undoes changes made by the commit e79255de8581
> ("sfc: Do not pass non-TCP packets into GRO code"). Those changes made
> sense back then, but now GRO can help with more message types. Instead
> of passing just TCP packets driver to GRO now also pass UDP packets.
> 
> Tested on SFC9250 with a UDP_GRO socket.
> 
> Signed-off-by: Michael Baikov <manpacket@gmail.com>

This seems sensible enough, but I wonder whether, instead of doing GRO
 on TCP|UDP, it would be better at this point to just pass all protocols
 to GRO and not try to be clever about it in the driver.  I don't know
 how likely other ipprotos are to grow GRO support in the future, or
 whether the front-end check in the driver (potentially adding cycles to
 every RX) is more expensive than having random IP go partway up the GRO
 stack to then be kicked out onto the non-GRO RX path, given that
 there's not likely to be much high-rate traffic that's neither TCP nor
 UDP (whereas when we wanted to separate those two there was potentially
 much more value in doing so early).
So on those grounds I think there's a case for a straight revert of
 e79255de8581, but I'm also okay with the approach taken here, so
Acked-by: Edward Cree <ecree.xilinx@gmail.com>
 if you want to proceed with this version.

> ---
> Problem I'm trying to solve: I'm dealing with high data rate, small
> message size multicast UDP traffic - uniform size, addresses - a perfect
> candidate for UDP Generic Receive Offload (GRO). Made a prototype - it
> worked as expected on the desktop during development, but wasn't
> producing any GRO coalesced messages on the server.
> 
> The server uses SFC9250 and turns out its driver only allows GRO for TCP
> packets. Change was made back in 2013.
> 
> Expected user impact:
> 
> 1. GRO will start working for UDP
> 2. It might add a slight overhead for UDP traffic for e10 drivers.
>    (this bypass only exists for e10 drivers, for e100 (ef100_rx.c:140)
>    packets are passed to GRO unconditionally
> ---
>  drivers/net/ethernet/sfc/ef10.c       | 2 ++
>  drivers/net/ethernet/sfc/net_driver.h | 1 +
>  drivers/net/ethernet/sfc/rx.c         | 3 ++-
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/sfc/ef10.c b/drivers/net/ethernet/sfc/ef10.c
> index 73bc064929f6..ab0f5e8aae6e 100644
> --- a/drivers/net/ethernet/sfc/ef10.c
> +++ b/drivers/net/ethernet/sfc/ef10.c
> @@ -2955,6 +2955,8 @@ static int efx_ef10_handle_rx_event(struct efx_channel *channel,
>  
>  	if (rx_l4_class == ESE_FZ_L4_CLASS_TCP)
>  		flags |= EFX_RX_PKT_TCP;
> +	else if (rx_l4_class == ESE_FZ_L4_CLASS_UDP)
> +		flags |= EFX_RX_PKT_UDP;
>  
>  	channel->irq_mod_score += 2 * n_packets;
>  
> diff --git a/drivers/net/ethernet/sfc/net_driver.h b/drivers/net/ethernet/sfc/net_driver.h
> index 71144bb4c6c8..57cb508d82fa 100644
> --- a/drivers/net/ethernet/sfc/net_driver.h
> +++ b/drivers/net/ethernet/sfc/net_driver.h
> @@ -341,6 +341,7 @@ struct efx_rx_buffer {
>  #define EFX_RX_BUF_LAST_IN_PAGE	0x0001
>  #define EFX_RX_PKT_CSUMMED	0x0002
>  #define EFX_RX_PKT_DISCARD	0x0004
> +#define EFX_RX_PKT_UDP		0x0020
>  #define EFX_RX_PKT_TCP		0x0040
>  #define EFX_RX_PKT_PREFIX_LEN	0x0080	/* length is in prefix only */
>  #define EFX_RX_PKT_CSUM_LEVEL	0x0200
> diff --git a/drivers/net/ethernet/sfc/rx.c b/drivers/net/ethernet/sfc/rx.c
> index ffca82207e47..929ecb539b64 100644
> --- a/drivers/net/ethernet/sfc/rx.c
> +++ b/drivers/net/ethernet/sfc/rx.c
> @@ -401,7 +401,8 @@ void __efx_rx_packet(struct efx_channel *channel)
>  	if (unlikely(!(efx->net_dev->features & NETIF_F_RXCSUM)))
>  		rx_buf->flags &= ~EFX_RX_PKT_CSUMMED;
>  
> -	if ((rx_buf->flags & EFX_RX_PKT_TCP) && !channel->type->receive_skb)
> +	if ((rx_buf->flags & (EFX_RX_PKT_TCP | EFX_RX_PKT_UDP)) &&
> +	    !channel->type->receive_skb)
>  		efx_rx_packet_gro(channel, rx_buf, channel->rx_pkt_n_frags, eh, 0);
>  	else
>  		efx_rx_deliver(channel, eh, rx_buf, channel->rx_pkt_n_frags);
> 
> ---
> base-commit: 98c2ad4f5d805dbc1ea436a334ee59311806a48c
> change-id: 20261018-sfc-gro-udp-5d3e9a3b2b54
> 
> Best regards,

