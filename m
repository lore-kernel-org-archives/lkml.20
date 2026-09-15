Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3064AF9F0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490717; cv=pass; b=JbWX8jIWxTgWwrgzXeYl4mxzz3IDKipcBfTl91VIW3/zSs3UWqBQC0uanCPRqQeIglTjwwaLQbRceHmjVCq5sftJvXJ2U2LCEmhfIZu1n67poJKOX+XhLb54wDs9UhQK7b1dZhTzPTZZnQ9gGuZFQuJFmZLM9ZIo69swu7AqBrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490717; c=relaxed/simple;
	bh=9GwGGvfgvBSHcRik0ICfQ1lf/eR8Li3EDXS5Aa6fYyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFqFJUJxYOeEpmAMUzcFBpncy/coRS1wCVQogytFcVvDdUGG9Pb+ai22xbvmq6j41Molbgmvx3fN5JXJvFdbmGkZNsB6xYYCoTemvvullf1vXf2u1923g5r9QipMuzKcNydR0Ci1TtvfWo7fNA9yiJdcNWxm568JTIkUIzD/QUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWdbq7zW; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWdbq7zW"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so3083666b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789490713; cv=none;
        d=google.com; s=arc-20260327;
        b=YDEjI4pyeLGhW1YyRjokOWJNe+KXddjcaFtodQi1fJZtFW+Mi2sEG/yWXu1qopqU9i
         tehlOU0pcU/ingsgtgtfunqccXnwBaaPw7jIy5v5XPr9Lydh6iaOi4sDbMkTDtxfzjaB
         uNrnQYNrOo1pm3GAfupt0NiaCY5c7rtbepGNlpNhC0ShChfKdXiWNIiXe62m4hz8Siyl
         pTCPxuRz3wHO2cnlzEsZh7396Ga+9ItCxZG0YPNe1vnWFW4wgWm2KtLxM3qMdFDioOWG
         ql0shvV4Sozk1D5mk5iC/kWi5ByTO6POTRUzGRzdy2iHZFcLLWGNzAuVQpJUM9xLikeA
         qy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vcZ5cZp+MTIDohAvU1rokDSJo7Wxlod0GJ6VhSswrLI=;
        fh=iyzo4fnF6CFIkXldNzjqdEg6IkHbnYffw0LdNU9F8mw=;
        b=gCWlcKshgCpgpr9irmP132KrGXvDmJMIlJbTlqdfZZVdLBhe+NrIGCNGWCMY4WXDuo
         9oaUtv/feWcU/CHcmatnxYUeIjhLKRBmleJJaFkPlcsP6beclTlE251oLgmDWnZvJLyw
         YyXsJA9c71rM3HN+r/9KfYrW3P3GYAg2RtJytf96nbp5mh25iBoTGdgny+ADNiRPj305
         NHEr3rR3C0pPXInIr7C8C8ts5O/3XBbppNxmXxSIl4liOIHyCI/5Muv9yEaF+o11V5PU
         /svTDKHChvTshYRqF0BfERLcIZwFzDK783Lzj3Dqs7miNac1wWiu9R/ZH5ke07Ooo9rv
         4ofQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490713; x=1790095513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcZ5cZp+MTIDohAvU1rokDSJo7Wxlod0GJ6VhSswrLI=;
        b=NWdbq7zWlVt/zVbEe0MZAYwCGJspihb0GSaeHkvsFInx0ncVpk0aLQbQgxWkAJlrD7
         yR2mwE/yH/9ATmf0FIPL2W2NDrt9jd5etw/+qi3qaJMVL3fIZTLdF+LwnWVn838Zg1Am
         rPDvNvDdVAkYK1NYFiU1rkEqzXFJg5wLjIHNGK4c+nmveCD7K+nSd2pws03M0XMXZmMl
         hRw+cptuUTGspkdaa4kLd0388NR4V+0TyzqfltGne7vRVqSIY6firDHXRzfB/tApUBRH
         tA6s5zzTuwAt330VNxqaEzrNPcPTq1zD1znhJGOhr4/zk8eHKUwscT2ClHgJHXtZy1TU
         jR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490713; x=1790095513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcZ5cZp+MTIDohAvU1rokDSJo7Wxlod0GJ6VhSswrLI=;
        b=C7jtEjKQwY8kiIjbHsRf7K56FEKeWNBWcEZYoPKf/iDdICmUH4sDy5ugIZU9srj+zC
         tk3m02EJtg0Nw/redbEBDZXMXbuHyRwe+hQVN2y9VPYVzNv/FjhGfkcEvEavabvlEAx0
         pBTUxwYS0l7px0omTtlrFjLcpCAYNkc6Cj92qaWhk4wh/+ZDca+bbkJldHK+Gw5Yui3q
         UStYQ1waCa7jEJlYSKzU/pCaAWyRu9LDDcwTj6PDfcDtnnPKyP4C57/QqBKBAfoQ/ymL
         b6r24kuT9Qb4xzuoL+hDYkwQPB65xEbTse7AO1Pr+ZjJB7djvP3j1fX9gWio8XPaR2dn
         MEig==
X-Forwarded-Encrypted: i=1; AKwUvBzLO/a3780FgmYuy0G9MfL+RFnr07wZENwsIfvsmenySyweCSmKdniHrOlOUFtBkzS73qlpiXx0i1rcFF4=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ6N/MjMoz67HjBOP0wt68GClxmkLivdaBPlHBv0r4U/cJzn4I
	BKPQe9amGEdMTNqwQ0nE1S/9O7tvTWQxHlSume19uSpOAN7UqyiB/QRxrVwBz2HV4os+kvIpLAO
	JJ9ddQILxJU0psI7wi1dnR/GCeqIsoCA=
X-Gm-Gg: AYBFou3CkHwrbC+/nIR5QlRp4XkX92oFkFtYhGKz83xWfoh7pxuZyvH4/sOEsMndxmX
	E4Z+ssEO3rjnmej6vcwoBRIg1k8FKCiYfaps6C0hBzcYrVtpvVuA0LVmZ1GVKH1cZC+0VCNciZA
	pKdSkJkFoe7lV3jef/E08N0Q4+3QuhVHLHVnr2rVlcYL1lXbkQsKh8oBv4ilLna3Y4psUlUZxIV
	/PN6ANW93zP9v8zsP2d9Vi5iIlhO3LVWQ21MytGqJ3DjfFh3vJ6weWvZxYiuW7juNoqT2U8ANb9
	SHFgaclel0FYnTPXSMDYYVXnqhPEQhMekBBx2iWj8d35PXJvc4NO6I2/DB5RypNx8EDa/cUIhBW
	hl32KZz/fsX4AudrxutC2Lr19hgDNWvqDyZCnwaXTyLrx8aJ5TcLd0/ojOTWM3dJUlti9avPBBg
	OOf88mnK9bRw==
X-Received: by 2002:a17:907:948c:b0:c24:adf4:5c73 with SMTP id
 a640c23a62f3a-c29d773fedcmr161284366b.1.1789490712483; Tue, 15 Sep 2026
 09:45:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914041221.1028092-1-zack.gomez@gmail.com> <aqeyvaw06I2883Fo@gmail.com>
In-Reply-To: <aqeyvaw06I2883Fo@gmail.com>
From: Zack Gomez <zack.gomez@gmail.com>
Date: Tue, 15 Sep 2026 12:45:00 -0400
X-Gm-Features: AcwNN1WDQXY_pMC5NqZrsA4SmeYj4x-kFu6e6I1hVD1u8f-sluStJigEyZ2240Q
Message-ID: <CAErB-w3fmW4bQqRg7895dZ4ZRqkDJmfb7FSCLPvRCkwrhQzaqQ@mail.gmail.com>
Subject: Re: [PATCH net] netpoll: bound the deferred transmit queue
To: Breno Leitao <leitao@debian.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 01:47:39AM -0700, Breno Leitao wrote:
> I have a patchset that does exactly that, which I wrote after
> hitting a similar issue in production. Would you mind having a test?

Tested your v2 on 7.2.5 with stock netpoll (no cap), same host, NIC
and reproducer as the commit message. Two writers offer 200k lines/s
to /dev/kmsg. The slow-completion condition is the one from the
original event: the sink only ever receives, so its MAC ages out of
the switch's table, the switch floods each frame to every port and
pauses this one. "paused" below is that state; "learned" is after a
ping from the sink put the MAC back in the table. parked is the peak
skb count in npinfo->txq, slab the peak growth in unreclaimable slab.

bucket link sent parked slab backlog
20k/s paused 8.3k/s 152k +116 MiB growing
10k/s paused 8.6k/s 58k +27 MiB growing
5k/s paused* 5.2k/s 1.1k 0 flat
20k/s learned 20.1k/s 1.1k 0 flat
unlimited learned 200k/s 3.0k 0 flat

* at 5k/s the flood is light enough that the switch never pauses
the port.

Seems to work as advertised: with the link healthy the target sends
exactly the configured rate and nothing is parked.

> I think the rate limiting should live on the netconsole side, not
> netpoll.

I'd still argue the netpoll change is required: there should not be
a path to OOMing the box. The rate limit is opt-in, and even once
set it OOMs the same way if the limit is above what the link is
draining at that moment, which above is 8k/s under the pause and
200k/s without it. The two rows at 20k/s are the same configuration
on a good day and a bad day.

I read the two as solving different problems. Yours is consumer
side: it limits how much damage one machine can do to a listener.
The netpoll cap is producer side: it keeps the sender from damaging
itself. Both seem worth having.

> If we do end up also rate limiting at the netpoll side, I'd like to
> see a WARN_ON_ONCE() here, since it shouldn't be the main ratelimit
> path, but rather something to flag that something is off.

No strong opinion on that; I'll defer to the maintainers. The drop
is counted either way: netconsole sees NET_XMIT_DROP in
xmit_drop_count and exposes it as transmit_errors.

Zack



On Mon, Sep 14, 2026 at 4:47=E2=80=AFAM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Mon, Sep 14, 2026 at 12:12:21AM -0400, Zack Gomez wrote:
> > A producer that outruns that drain therefore grows the queue until the
> > host is out of memory.
> ...
> > Observed with netconsole forwarding a GPU driver
> > that logged one line at ~1e5/s after a firmware hang.
>
> I know what you mean, I'm seeing the same issue on my side.
>
> > Cap it at 1024 skbs and drop new skbs beyond that.
>
> I don't think netpoll should be the one doing rate limiting here.
>
> I think the rate limiting should live on the netconsole side, not
> netpoll.
>
> I have a patchset that does exactly that, which I wrote after
> hitting a similar issue in production. Would you mind having a test?
>
> https://lore.kernel.org/all/20260910-netcons_ratelimit-v2-0-ebf0dd91e26e@=
debian.org/
>
> > @@ -314,6 +322,10 @@ static netdev_tx_t __netpoll_send_skb(struct netpo=
ll *np, struct sk_buff *skb)
> >       }
> >
> >       if (!dev_xmit_complete(status)) {
> > +             if (skb_queue_len(&npinfo->txq) >=3D NETPOLL_TXQ_MAX) {
> > +                     dev_kfree_skb_irq(skb);
> > +                     goto out;
>
> If we do end up also rate limiting at the netpoll side, I'd like to
> see a WARN_ON_ONCE() here, since it shouldn't be the main ratelimit
> path, but rather something to flag that something is off.
>
> --breno
