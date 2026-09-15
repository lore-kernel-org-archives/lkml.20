Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864014AD4CC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490461; cv=pass; b=Zt+/epDXpuyU+VsPk8ftAhQJbOiIhbpvaynv0SoJxiZzqjV6a4rsJmnQ0aCuT1X8cu9KgmWgkPqwY0pVD7ruGhJkmrYzLH31dicarqmxq6MdZoaCgDtiZxMJL+3jvCwRF9uOuxqk993NpBU2sbD0Q9fnWlyOKGrVHe5lYx1n+hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490461; c=relaxed/simple;
	bh=WZtIOEajUb1A4OG5IeP7r4iAQRTAEwrxT1fJ01BsrTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOOJtdOUnv3uw+aO+RFOHJNu4l1I+pK2mDCBDzrvF7xNATBPnU/wGtI5Vu+mjFrICZibuvrsHWfGMM26upMPcUOSnnNF8TjGWw87JDmJEtDBN2AZ9ETWK9yHj4VHNJJn1eEZcseSmJNayVS1X7YQRkFthg66SbtX1O6D0/+x9v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZXoHJoB; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZXoHJoB"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so1689266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789490458; cv=none;
        d=google.com; s=arc-20260327;
        b=SESlwoEWT+Mul8+5KQOsI7ikiJzi2A9buGo7f/xgdRLXxXKWYpP75n6YTYjy9Hf1jo
         J5amNkCOThm4urUazLkYxWawvZ49ekiXAfGtBYX6cI6w+LKtubiF/vb51ZXz8ZpmTHbI
         +fNagH3RN6pb7VQaJFUwq1p3jDAue+LpYOLlfliU7IfoZg/TtK+pAIdwaALy5SmAxzfO
         iNpNBZQDdirLsffMZkA0f4pBR4Ce2WPVi91179WmoHtN9+T0VALAJpX0Z7nH4ZAO0Ihf
         2ndsHVMcLCnC1uEuqb5JalVFBn0Uyoo+GedMhVB5fiewhYLLD9w9FMCgmidbVAmKsrgV
         EbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vu3NNJZGM/HCH+I3878/9beQnFbZsU+rMWWInCqvw5Q=;
        fh=yX8bEwCThMQVqm81gZT7XNX/Akg5lw59Rglbw+IYbkk=;
        b=kHNLwuv71Z1nGr67XBAxShJu59rUO2fj9voPJrJiIOQsImRN9mjoQWnVasNDUuTV2R
         F2D0Jf/EBB123r2Zo6iX/RW/Rz5eY/ybb30G4FB0S4XBsekbrQVkRHryjzYvzFrknMY6
         Hfj6J4jNzCXUSesAVfUXLDcbXootX/6H3JidCOVA26BKNP7lXQl5pfwB43vD8DVu58/q
         gsT1lp033iSMBQTqkSXq4jn1BdkcBuf6cs6pMSmWuOyCeVyRM1x2m8T7RORM2UD+FNOP
         DNOyH+T9grh0haRyvzZqhsxam/ATsQjEAs2kKMqAfto7QuGuVBymRrZGXKuct78SWhOF
         6qfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490458; x=1790095258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vu3NNJZGM/HCH+I3878/9beQnFbZsU+rMWWInCqvw5Q=;
        b=TZXoHJoBzex8LT9sllzvfXb+gaxEyUDcHaSdPUHfZ/d/RlW6ikG0SRIQgV9QJMq+89
         8OGoivjQWCYbgbEnlav790Fgc9FvGOXvbFlkSiffIFQNRSytRc2jYTXuaE8rj3AcgIqW
         R0xBxukM3pfM9KmNV661m885KKfz0Pz5uD++jgelyoHNu8NZHdlSzjxIUb6Heg4Ssfg9
         P3qP82gwjzO7SLURAfHc6wtI9iQIOL0kvOiMi6Fw+JjVuOH1BVg4HT6okDqv4nAN+V/K
         fGY+r8YKnP+/xStiy3lEjcFMVnETZj8FzncvEzi8becKegZkWaSRSqHgpk1fMPeOfrVa
         VuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490458; x=1790095258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vu3NNJZGM/HCH+I3878/9beQnFbZsU+rMWWInCqvw5Q=;
        b=zwtwVtWz2HmLzODz/xDdkW7IKZ8IF8UdPe+ZMXpPgKrRRrITOQAOUvCFWOpM+nxlPv
         5OquG8wF3YVw3T3d02POS/MGi6q0CH1YIDhQTeTcs5doyiLct9nToyeZVxd2rp0xvNfE
         j9JF1sN/mDVv9L6DJUxIGqwHVSulmTkxUlyWYSD5DuUTJ/rzDRB7WX27vDDKjwDwJZdI
         PeuGJkdRKK7AeNqB5fotOkt/BW+HsusVIY2FZOrCQg4UyQxOWSWXYB918oPAfrya4V1W
         gwr7XR6Kcc0Tz6kOA/qRgRBiEjyybOIXazfDT755ixZdRWh0DMT/GWIR2/U9AQrtX774
         H9Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxCINJlCx3cJ5cgmyzQuFykYlGyZG0poPkVw1RtVUqdjLPR557naDbIf9jLD8oMa8XdwYFVOXdgKg8Dijs=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ2UKzS8KGEIXNUmgW1B70isqCUOAddg2K6PPGre6Yq7cQNhcr
	iuI0K4qz3k9WS509R91mTmk2Sdgi9XZ6AL8aJe+GnrdR2AOuwwnd5ML0cXmNywN6vnsxjOl91Vw
	Z+iSgyM+EkteZLdYQuzz+3y7j7NNwHeo=
X-Gm-Gg: AYBFou12T087+0Z7qISv+ov/erXlNPUn40jZGtuICi5uZKS7wEJee8FiIt7JBbre2V6
	kXph7GJck7e9LiAsrCThRhRhZq+vetRTCQ+zXVvyFs9iOJFyz+iXda1uBMaeOpvHWTZSBZv0Jxv
	Lrlt0/S58XzNqKjmd5aX2WZCbDouwx9MWG9U/oz+inavqV+h9FovarzrpjeqjhJqAUxSbXPDDHj
	UUz1sLzl3LKFkT5zI46RYiIDT6b3a8DEoPVx4JfEtnG6mtzD7Y33qfPs7lt+sUHnLGsAL1hrIUA
	kaDf7aw3akeypV1EA5dbD06qKL4TO2xtQ11zgiCNlUyJMjRJKrBNEh9uvmrMHoyqnJzQ04m9gBa
	LuYGk41Al5F9CuDlN9D8Tlo89bRAKYGLimAYhjqeGK2hInIeXMvuIK74Yn33rxMWOAzV58qiA8i
	D1hdOHhvWTJw==
X-Received: by 2002:a17:907:7b8d:b0:c29:5172:6151 with SMTP id
 a640c23a62f3a-c29d79cefb4mr148064866b.45.1789490457246; Tue, 15 Sep 2026
 09:40:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914041221.1028092-1-zack.gomez@gmail.com> <aqeyvaw06I2883Fo@gmail.com>
In-Reply-To: <aqeyvaw06I2883Fo@gmail.com>
From: Zack Gomez <zack.gomez@gmail.com>
Date: Tue, 15 Sep 2026 12:40:46 -0400
X-Gm-Features: AcwNN1V1k-oe92wPE5LgPY7yR0oPHt-_r4hbhbeUUXP5pnRcpfylG1YgWf8SGfA
Message-ID: <CAErB-w04-1NAxCV7hdZFxcbYx5LTocmtvCOj5mOSXD5yCCTqXQ@mail.gmail.com>
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
