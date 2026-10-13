Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC61535FB7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917506; cv=none; b=N9K7CPv5uq0KLzsCqx/D2jav+D0LS6dWExubFHSAm2s9nK9QylYe/zn0GaeuDSNqt49le2PyQle16Dlub3lULQnrh4Qj83aFTtLipW0w8e4KJmdRBrkw5mA8P6ps27qCd9q1nEz9WKIOhBkZUCyoqsEdx5tqHjPVPF4QeN33KJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917506; c=relaxed/simple;
	bh=vQQgX5XfftHA7/vosJgmBjICMWrkz0gmawEsGmWcNVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o94Yzy1wb1E7soNR0WsmpdyfnraZfwwcyGXtsmPJ2UFFOJX2SMmWao15BAuntdUQm3vcxaE20psQNB3Q/tBYOwtvJ3ebEyzxHqSaO4Xw8u+TfAeZKu6seH+YrxzSUepypq6cWhrLLwamuL9NND9PUWILok4JxW2hJmxmR40bjGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=DH/txF7V; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="DH/txF7V"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-4949f037131so1772061fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1791917503; x=1792522303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NY6xAXXWFY1zXXulN0UI4uvJ0IhzTvnKlTHvFNUGXLU=;
        b=DH/txF7VSSKRokWYAaaNlKbUbJ+/VOcvq3ui8Zgq2I+l9Z1NdYv1WIlK1RamCd3CNi
         ji02JoFfrzg+lVeabBiZ8HtlxWnsU75kMq4/Bho1gqzduT/O4AE1R54/wJe260COm4/l
         9LZGmxomlQezqsVJEKUc6BnJnNaWv7WDQr0UyZatoQVjRH8XY4LUqXEwTQpAo/jdwJfU
         K+5esvyAx+vKnicekASkz+j3Elv2Zjr5SwrnBhpfsjjW6NPc9YkH3L2roPeo858eLnIO
         Cu+gg5LLDxrJsTzcYKKEdi+szcT1MddlzRxh1IbGF1eL7aHOnXbSWPc1/5tYetTMSVEl
         jOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917503; x=1792522303;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NY6xAXXWFY1zXXulN0UI4uvJ0IhzTvnKlTHvFNUGXLU=;
        b=k6gyhbxIMOlAatee2FMFR1ysNyTylaFBdrwttfqv79CZrkss4/YBY0tCONbSQMe2TG
         BeXI3ZbsdC4kfWNaRc1TfM96i6jz9EVRbSL+lJpgEpLMhfIVFKOwQFxzkXaghtyxvKT1
         F944vxkx9pQptwqNhaAREJq2ANNWsNgDTuXyyJt3cYq/S2h+3uG3h3CTDsp4MPgH37Yq
         GT5+gbNgkSzj9EIrqg5/oFqpfbJcX/+oSFDFYyLOelEyiQpGyr9vt/aW9V12B2FdRS2j
         NL1EDTC9DXtareETP+2mRVXGzWa9uifkiQsWMSM04MMiTwdC9RfX2CSKQKNlXocGGRKB
         hkLQ==
X-Gm-Message-State: AFq9FYK1BJdJ8tmTN9iegsQSuXJYE1aJ/YTSlMyx4eABCvX/mFspdUsf
	N2L6ctBJ2t5YMCJ801ZHr5UHQ+/7oZOl2p+7/l62EnzfQDHMQQDl4Hji3wXa3EbsZmc=
X-Gm-Gg: AYBFou3ZFxLkFbbcBvLiV9H9S2k8OX2yW9pc1OH+s5wsTlytvTvxQN8ah1H8SKFCSr5
	dVEgvMBLa61h+L06z3/z2M0ePzCBnI4fdVIp1+aumYOMu3x045daBFloM9OF5LOzyYVxXqfsSFW
	RvWvRzYkZ5TkFf3P8gUurWZ3gCFElxB2O9gIbGaz51YBtVlV84uaXN/5BBccswnemt1+CPgwwBL
	3WJ/gBApggTaBFlDIsZktqXoS2EWppPLuWbt46iFKzMqRgClpjQ5SJGtw+qh4ZJL/y4SahtRtuY
	9xNbH8OsBPzmqHTfKJkm+pWB0u2Gzhg8D4sBRMekP49i9kQtLcyExi8nkCSbK2JVps64IjaEJTy
	P2gVLcN3+NBa5vQw562T+0Iwd4YRdXAcaRlCm0E4yCTOqM4kh7kf8LaMPX7ybC0m5twhQnfv1qS
	bSaBForYtJOZx21PfbvG5wDy0GNZknxCg4c0UzD8A7PskXF4OZrmLVcP+WX5VNzn5JHA==
X-Received: by 2002:a05:6870:21e5:b0:485:d1ab:793d with SMTP id 586e51a60fabf-4a2a889fee3mr11368650fac.30.1791917502711;
        Tue, 13 Oct 2026 11:51:42 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:15d7::22d:151])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfbd6a92sm409039fac.9.2026.10.13.11.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:51:41 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:51:39 -0500
From: Chris Arges <carges@cloudflare.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Paulos Yibelo <habte.yibelo@gmail.com>
Subject: Re: [PATCH net-next 0/4] more virtio-net csum hardening
Message-ID: <as59u_oxCGn4397B@20HS2G4>
References: <cover.1791887415.git.mst@redhat.com>
 <20261013070259-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013070259-mutt-send-email-mst@kernel.org>

On 2026-10-13 07:05:34, Michael S. Tsirkin wrote:
> On Tue, Oct 13, 2026 at 06:58:28AM -0400, Michael S. Tsirkin wrote:
> > Allowing untrusted hardware to specify csum start/offset for
> > CHECKSUM_PARTIAL was not a good idea, because, if it edits the packet
> > outside the actual checksum, and depending on the setup, the networking
> > stack could be looking at the packet both before and after the edit, and
> > seeing different results.
> > 
> > Previously, commit 6785011f8b16 ("ipv4: validate checksum_start before
> > completing checksum") validated all known instances where this
> > causes the most grief, but the real fix is to make sure
> > that either only actual checksum fields are ever edited,
> > or the checksum is completed before the net stack looks at it,
> > so it is always consistent.
> > 
> > This basically does this: checksum at ingress, except in a narrow list
> > of specified known good cases.
> > 
> > Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
> 
> 
> I forgot.
> 
> Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> Reported-by: Chris Arges <carges@cloudflare.com>
> 
>
I did some testing of this patch-set and it mitigates my cases in VM
testing.

Tested-by: Chris Arges <carges@cloudflare.com>

> > Michael S. Tsirkin (4):
> >   net: add ip4_parse()
> >   net: use ip4_parse() in receive validation
> >   net: resolve uncommon partial checksums at ingress
> >   net: account for ingress-resolved virtio net hdr state
> > 
> >  drivers/net/tap.c                   |   4 +-
> >  drivers/net/tun.c                   |  44 +++++++-
> >  drivers/net/virtio_net.c            |   2 +-
> >  include/linux/ip.h                  |  24 +++++
> >  include/linux/virtio_net.h          | 161 ++++++++++++++++++++++++----
> >  net/bridge/br_netfilter_hooks.c     |  15 +--
> >  net/ipv4/ip_input.c                 |  13 +--
> >  net/ipv4/netfilter/nf_reject_ipv4.c |  13 +--
> >  net/packet/af_packet.c              |   4 +-
> >  9 files changed, 228 insertions(+), 52 deletions(-)
> > 
> > -- 
> > MST
> > 
> 
