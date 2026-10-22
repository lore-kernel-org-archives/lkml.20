Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702087;
	b=zvg3Dn4ve/V8BzbkIFYQa/xYB9dcFIBTnfUQHNeyOKjQ0tsZrgmDsmecqPW7goa+ql5C
	 1F82eu662bmMRWOcD/hD8Nz+SoiV5EwMWGdSch+xOM1nmB3YGLt28ZivRR6nHsTcmcvn8
	 xOoLDH7yZ2XhwO1tNJrEwZzfhJl6JxnSVbDfNBu2q2eP758fCmoSubeyPDk/e8ZlLNo5G
	 P91/1jGZxv/emwsVDRRt4CO0+eDwkij8wtlkyjaDShPVXsXVMN/gP4l4I2BSMS7vHJ5Tg
	 zDINRB+JEg0KaV1Ip7JEsTCc3sff/LILrDzokMhVToAqpJUc8pUjczExCTYtWAqG3yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y5/2svsntF9R7wAKTIjqq4lXpmG9ahkTltbSjO27xnw=;
	b=sDQh5ymwl20KbKnouJ9cL+H4ITjYDPv8lL4M/OivkQnSWZSWz+T68UAbH1dkGfRR7js8
	 n4CqxmGLchNS7DyYrjPTYEdgEog24F2sCllj0x9ux8cIlGZXu/tVsMLBdoI4FseqBeoMe
	 aoAKbd96iH/74veJTq2SNycjqu4ACoCFU8WOuk/b4jdekb+Rig8Ir9MAx1j9kvDz1m635
	 N3eA785hKgxJqED39DAJjx3DuuHrdNvmzfBGcMT2QuOr1ennM5cqfMq4D+XtEA4qAkGg7
	 6mX2o2baKhk0kceesoNN04cZrJCAn584f77Jv9KurRkYW/yX8dxoKo51uwQgUHBoGsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mbtscbdr;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93511606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93511606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mbtscbdr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so2138855e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702086; x=1793306886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5/2svsntF9R7wAKTIjqq4lXpmG9ahkTltbSjO27xnw=;
        b=mbtscbdrs7qZgCYJ+njfdJf5aVFoyYRLmprOpQi6PPJ3oWFxP4h9Z2G7jXnP9/uTve
         QN0ANENOrCfjMEiNhzjQhtxEdb50u3UrAupcb6Qm4gXaBz7gJs+KPa1yQCNYIiE5GpVO
         Ilmy2epFjqP4RtbJ202z8d/RMnqOKlht50McXYEipVy2Q7hbJtTklVfihlxv+/hGJAyX
         VNzQFq331nQL3Qwn+pSiANu2ysd0xfEcW9S00FYww2oKTSLEr+lTxchpj3MKv/CZZ9pI
         uWkyBQLjvNGE00Tx80HO2RANZBbBo9bA9nY7bNBh3qHxG4RmRB6mQaLystsYuiikPnN8
         9aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702086; x=1793306886;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5/2svsntF9R7wAKTIjqq4lXpmG9ahkTltbSjO27xnw=;
        b=dj9+1OzgynZ49bMH6MrQ+2RBCyg7/c/nvWcZH7XbGzgViw/jV9J7BvJTNzG/oXjn4p
         xqu9cNQ7rLfuaLiRUZ5PGXl9wmQx8UnkpRT8blcEyZu5Y+UqJj9NYByBLYJ3Ldj/NMLn
         SKxVjlvVfp1Ik/67KxRv7CFDFDPhizDXZ12arSY/+uHZMopx5/B10U3VZcecA+WPl8Wk
         mAjvOx03pgEhA7bJBd1zNJY2GH7ueWnn6kCDNh7MNtIaEje6bR4Bqsui9Kzz2vEbwiBi
         8oTggU6tqakKj/l3YSpu4EIwMqOVpkO6RJNfTcdJH5eWdbW2qjLLYmWb1DKWaTk2rnSN
         S3ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeRW/LZg/yzp7NgepcK/WLhvjpJrUsX0WJ+K/pT3bmdotWjBLomhYB2WY2fR33Q/hq7SoA+nTjTklGg2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcTJ69s5o8NDDG78838dWx6fdeRnoA57ZjBu1uw8A5/sksjle4
	plfMdhAsTEZWAJGlwo2VD43N8dBkh5o7FubDQNmvbpbtHrQrw5xYb4El
X-Gm-Gg: AYBFou0ZFw8o5+aQRaEvG4qkdj2Dbwr9iYy3fwD/3bxvpmVfIWD7AEcltEJM3JHMWX7
	PTfCgBvg2traJY4VHnwAE0G0xjWvBdvpEiVBwGSZ3vcdbycwmf24kzMYoHWLufjf2V3HkwaQaT5
	rTP9JKIU6Yyxnyk23Em3see2YeHsnec9Ti9Ms9x3JJUwMe66kiqXNBDKGvMxG0lcO1qXuOVp4x1
	SPgXOF03WJ3Iptl+tcX8b6q/GREoIwrqWRZhJx8uEbRO+UvNY9oaesfkSYDjiByONXA5bkAgk1p
	uKUPSSxcM4f32UbBIOm6vf2r2dnJPshKRXarDT4jxxrAsSvXg2TLkwtLpT5fghzpRpSEnK/IryS
	v4ZzmuUAHBnvoM1g4YzhJ8wN+0TjoqYtgUB1QmmZrIbGhW7bUO0Ydwmw79pKv10+y5hpFx8qRFS
	0RUN7bYYXV09LSQ7xTeqcV6fIyIlgLNFOeQxeAd1M3f4EWB+6666c51zqqSdj4pT6/sbpaDLmfg
	IoW7+qykXFTpL1vlXwbJsOky8ZwpF2Ultaf09Jvi7GfvgLT9yq//NYw1LBUNza0Vf+aBbjSganu
	ROYKz0li3EaAhjSOvOBn6qwtUzKn7IlC/5too+c=
X-Received: by 2002:a05:600c:1c09:b0:4a1:f377:5c6d with SMTP id 5b1f17b1804b1-4a211cd5bb2mr3236035e9.6.1792702085705;
        Thu, 22 Oct 2026 13:48:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380314aesm308718f8f.28.2026.10.22.13.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:48:05 -0700 (PDT)
Date: Thu, 22 Oct 2026 21:48:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Zefir
 Kurtisi <zefir.kurtisi@westermo.com>, Zefir Kurtisi
 <zefir.kurtisi@gmail.com>, netdev@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 net 2/4] net: enetc: do not rely on mEMAC hardware
 frame padding
Message-ID: <20261022214803.40cb2aac@pumpkin>
In-Reply-To: <kaqeg262ql6mucqzn46axaniowt35eq3hd52nefev2uvvkbfkz@6onteyxyjypx>
References: <20261021145314.1435049-1-vladimir.oltean@nxp.com>
	<20261021145314.1435049-3-vladimir.oltean@nxp.com>
	<20261022093359.723c7e93@pumpkin>
	<euqz7djxfn4tqbd63ymcj2bnu7k2bb6hzlmeilao3rvjdhyisf@bk3wj5hinfnr>
	<20261021145314.1435049-1-vladimir.oltean@nxp.com>
	<20261021145314.1435049-3-vladimir.oltean@nxp.com>
	<20261022093359.723c7e93@pumpkin>
	<euqz7djxfn4tqbd63ymcj2bnu7k2bb6hzlmeilao3rvjdhyisf@bk3wj5hinfnr>
	<20261022112218.11a1faa8@pumpkin>
	<20261022112218.11a1faa8@pumpkin>
	<kaqeg262ql6mucqzn46axaniowt35eq3hd52nefev2uvvkbfkz@6onteyxyjypx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 15:35:05 +0300
Vladimir Oltean <vladimir.oltean@nxp.com> wrote:

> On Thu, Oct 22, 2026 at 11:22:18AM +0100, David Laight wrote:
> > On Thu, 22 Oct 2026 12:41:49 +0300
> > Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> >   
> > > On Thu, Oct 22, 2026 at 09:33:59AM +0100, David Laight wrote:  
> > > > On Wed, 21 Oct 2026 17:53:12 +0300
> > > > vladimir.oltean@nxp.com wrote:
> > > >     
> > > > > The driver sets the ENETC_PM0_CMD_TXP bit to pad short buffers.
> > > > > This works, however sending short frames from user space and looking at
> > > > > the padding bytes inserted by the MAC at the link partner, we notice on
> > > > > LS1028A that the first octet of padding is sometimes not 0.
> > > > > 
> > > > > This is fine per 802.3, which does not require that the padding is zero.
> > > > > 
> > > > > However, there is an unproven suspicion that the padding bytes may
> > > > > come from internal memories, and unfortunately I couldn't get sufficient
> > > > > priority for this octet's origin to be investigated by hardware
> > > > > engineers.
> > > > > 
> > > > > To be defensive and not leak any sensitive information from the SoC,
> > > > > let's pad all frames to ETH_ZLEN in software, so that the MAC doesn't
> > > > > have to do anything.
> > > > > 
> > > > > There are 2 distinct cases to handle, for GSO and non-GSO. For non-GSO
> > > > > things are trivial; we need to call eth_skb_pad(). For GSO, things are
> > > > > not simple, because user space may set gso_size to a very small value,
> > > > > which could make the GSO super-skb smaller than ETH_ZLEN;    
> > > > 
> > > > That isn't sensible.
> > > > The minimum frame is 64 bytes (including FCS), subtract that, the MAC
> > > > header (14 bytes), minimum IP header (20), minimum TCP (20) and that
> > > > leaves 6 bytes for user data.
> > > > I doubt it is sensible to do GSO for anything under the minimum mtu
> > > > (128 bytes rings a bell somewhere).    
> > > 
> > > My fault for not being clear and inviting this kind of objection.
> > > 
> > > Since we do GSO in software, we advertise NETIF_F_GSO_UDP_L4 too, and
> > > there, Sashiko came on v3 with the observation that for UDP GSO, user
> > > space can set gso_size to a small value using setsockopt(UDP_SEGMENT):
> > > https://lore.kernel.org/netdev/178960175550.22033.10648880872141935672@kernel.org/  
> > 
> > I'd fix that in the setsockopt code.
> > But that might be a bug anyway.  
> 
> Why a bug?
> 
> > UDP segmentation has to use IP fragmentation and that is usually done because
> > the interface/path mtu is too short.  
> 
> In my testing, UDP GSO does not generate IP fragments, but rather, each
> UDP segment is its own datagram.

Hmmm....
I wouldn't have thought that was generally useful.
Losing data from random points in a connection is going to be hard
to recover from.
I guess that it why it is per-socket rather than system wide.
I mean, you can run telnet over udp and just hope no packets get lost.

> Are you thinking of UDP Fragmentation Offload instead? As per
> https://docs.kernel.org/networking/segmentation-offloads.html#udp-fragmentation-offload
> this is deprecated and AFAIU not what this is about.

That is the sort of UDP segmentation I thought made sense.
OTOH I think the main user of it was NFS, but even then 8k datagrams
were actually so unreliable it was often much better to tell UDP to fragment
the 8k blocks into 1k chunks (IIRC that was a mount option).

> 
> The docs do also explicitly say that UDP Segmentation Offload does not
> generate IP fragments.
> 
> > But there is a minimum mtu for IPv4 of (something like) 128 bytes, and
> > it may be invalid to fragment into smaller pieces.  
> 
> I have no idea what you are referring to, here, with the minimum MTU of
> 128 bytes.

The correct number is probably 68 (min max size of an IPv4 fragment) rather
than 576 (for a reassembled message) - I think both are from the start of
the IP headers.
That means there is no sane reason to fragment anything so small that
ethernet frames get padded.

> 
> > > Sensible or not, it is possible, and I did generate a test program using
> > > an LLM to confirm this.
> > > 
> > > Regardless of that, the last segment of a GSO super-skb would need
> > > padding anyway, because even with a 'normal' TCP MSS, the skb->len
> > > modulo gso_size could still result in a last frame < ETH_ZLEN. Padding
> > > just the GSO super-skb, as I did in v3, would also not fix this.  
> > 
> > True, but that is a different check to the one you did.  
> 
> So what is your suggestion for the driver to do?

Clearly you need to allow a BD for padding if the final fragment is short.
That is one extra BD for the entire frame, that same as a non-GSO message.
You could leave the hardware padding 'stupidly short' gso fragments.
I assume the driver is building the ethernet/IP/UDP/TDP header so that
will be one buffer and not hit the 'fragmented after 14 bytes' issue.

> 
> > > > But does this code allow for the VLAN tag that you forgot about in the
> > > > other patch?    
> > > 
> > > Not sure I understand your concern here? Is it that with VLAN TX
> > > insertion offload, we pad "too much" (i.e. to ETH_ZLEN, then the NIC
> > > pushes an extra VLAN_HLEN)? I'm not sure that's a problem..  
> > 
> > That is a problem, VLAN packets should only be padded to 64 bytes
> > including the VLAN header and CRC.
> > However such overlong packets are likely to be tolerated because
> > an ethernet switch can add a VLAN header before forwarding a packet
> > and it can't know whether a short packet is padded.  
> 
> Well, if it's a theoretical problem but it's not a practical problem,
> I'd prefer leaving it as is.
> 
> Since eth_skb_pad() itself is unaware of VLAN TX offloads, I'd be
> opening myself up to an endless rabbit hole ("why didn't you fix this
> in eth_skb_pad()? It's a generic problem." followed by
> "changing eth_skb_pad() broke 20 drivers!")...
> 
> Unless it's very clear why I'd be doing this, I'd very much prefer not to.

VLAN headers came in after I stopped writing ethernet drivers!
I think systems have to tolerate extra padding when a VLAN header is present.

David


