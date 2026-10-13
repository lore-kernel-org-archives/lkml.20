Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4190547CA9D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924705; cv=none; b=Ab7KD8iqCzI/8TZwjzwRsiyoS0lOIbw2JvIdWhCFOnqqII4UPRCeq0AzLAPAzSZgKQXb6TsCAs28bwK6RYh71FB33ZXdN2BIKTwfOe8VsZY8EEw4ufYe8wDhlrBMGzFMH/u/VCKPQFceGmWec2QUcVBoplolWJ4X+6ZTBByvUwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924705; c=relaxed/simple;
	bh=PMk+BA1iV1gVZQS8hgs9PA8z+zdMSKtxYgSZ7oRIY/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hkhd3KSydynn5cJqzgDeq+jZ0WtjhQ/LP+JePqEzZleA3sF4OVe8LtESiFzDLztYAG5ZOf5Y8/Cgj8pA0S0ycNyMJ4q00Jtc8L7olvK6xfIYwMx1QNXK25fB9B6xT/1iSFLnnh2v8W1L5EAuqwIMvXxbFjJgWKgalscHfgw99vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O3HPlD77; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qwww5FIQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O3HPlD77";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qwww5FIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791924703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7QcsbmPf6U5Ksxc1MQJeA/MDBAEnBcFQoG0wVwoAmHU=;
	b=O3HPlD77MXkWiKVuP3vnxK6WGY6nYDcJmPmzspYrNPYkAe9ARXrBUV8qxCgkb3fcuENu4k
	b82GMOY8vxTXYXPpCbfd1XbpID816qyFcYlHLbgeNfJrJ8+yGggFQw6Me7K4sZLHsZwNzH
	a6Wj9aV/v6uOGA3/pZd8M1BNl64ribM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-rzU5RyqgN5myt-cKl7fMEA-1; Tue, 13 Oct 2026 20:51:42 +0000
X-MC-Unique: rzU5RyqgN5myt-cKl7fMEA-1
X-Mimecast-MFC-AGG-ID: rzU5RyqgN5myt-cKl7fMEA_1791924701
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso28209895e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791924701; x=1792529501; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QcsbmPf6U5Ksxc1MQJeA/MDBAEnBcFQoG0wVwoAmHU=;
        b=qwww5FIQSM52EVwuwBYDWS/e+pVnuttusi/Vp8HP+C/IYA01hzBc/FoUt+5AhFe4q1
         ATBJ2wshmKB75LSgZmDxbU7yYIVnhw9+JdIJgF97TXLsvym0WyWDpWDXNCsP4oiPthW9
         EkjB/AOYuWqEzHyCR8oI6bhRWwcxshF3qf4Es9JtDDD+romr5f2aZu7hmBMLvEBNf6v+
         hOBG28Wt+bgVB3vsSvweX/MGBmU4s7n3CzbQgV/Fcy4ryOwG6r28MJpaija6OiUg6DkV
         lOz9qrnYrVP/hA/zN9dxpkKpoehoEofzjHYTft0BfLldKimo/B4TSGXHxXw4YMOi/E9q
         URGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924701; x=1792529501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7QcsbmPf6U5Ksxc1MQJeA/MDBAEnBcFQoG0wVwoAmHU=;
        b=pPiYhDEGqj+e9D/v8wY4m1ZaqkK2DIbjzyMvFIh/mCy5wOJ7pHztPnsI6MAn8vVopL
         MCpNE1YhLSsrSp2vc9BBJ3S99/EUjevkeozD5tJKU6Fha3UpBB1yDfEXfTp2m21uRdxo
         QmXLXwDXTP96jpZFEZq9bAuSY06CYxDN1m+AhgHgOiK7srqinWey3BnIZvt3HHlxADmi
         QQTHoyBfcjTUTmqsv4LgtKdxF6LVuz4phgIT92z1xOmh1+jXAJNbxhuca28ajHwkJr8Q
         bXVnBZyoe70/QJI6DbYGcdUI8ssOudq7nu5oxIklXwS+lnLcwNRIVcgR5Xq1b1UGov4P
         vZGw==
X-Gm-Message-State: AFq9FYL8Ci6HiaqmHNb9TixAmgdeb3gLhdvz3+5OTc25PIoZM9381PKQ
	fW1oj/q3qsK7BNrqqU9rlg+PGLFgMLYL1XPCVZoCUN0lF+FFReiqL2aK1Fyn+Cn3I2NXvYAeLPm
	sXfe0lsqVKx4Ei0vDBrB36fNf9T7ocUPhmiUuck2QsXHiPlWfQE52u85ha9k1j5EwMg==
X-Gm-Gg: AYBFou0FFSFumHvnHwpiOi2E/GZu8YQzrMnaImg6niAPMPfHWSi7Q4uZy9EuHHGK5CY
	2kUTfSI2ygo1fj+lsKO3xX19AjZcMob6TAJtox+geXgZBB8ITF+093HwTMGy8rj3Ero5jBIc2aX
	zZ4jNuKtym7XIRDEUCT5OJeOq3OzoxigxDEsqGukCnCBKXhRfO79iz5uhaNFlu+r9BJXOqqc3uv
	rMlBJg3B2IJ35FUi8XCotvjVcUWqHtTKUlFDElSgmKFZrBngTnKIp1Iaqy3jSCH0j7yKo2d9Rb2
	di0eK7PRBKaFEyf+iy3nhy/M7hAggso1sEJl7eh2uMzx/WLpwcvzXj5wzotdHXknm6FvvA==
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr281153245e9.16.1791924700762;
        Tue, 13 Oct 2026 13:51:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr281152325e9.16.1791924699503;
        Tue, 13 Oct 2026 13:51:39 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm399689525e9.15.2026.10.13.13.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:51:38 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:51:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH net-next 3/4] net: resolve uncommon partial checksums at
 ingress
Message-ID: <20261013165004-mutt-send-email-mst@kernel.org>
References: <cover.1791887415.git.mst@redhat.com>
 <e12c6a45aae251d1642af55d8d3121e554993a66.1791887415.git.mst@redhat.com>
 <20261013070549-mutt-send-email-mst@kernel.org>
 <CAF=yD-KdTn2rHyp_j8ORr9F5hpm=TzaPRan5+gvLiYBd9HP-sg@mail.gmail.com>
 <20261013143335-mutt-send-email-mst@kernel.org>
 <CAF=yD-Lz92nGVFab1Dq8M9VusDsKf-ioda8KrZoyh28x3Xtg4Q@mail.gmail.com>
 <20261013163706-mutt-send-email-mst@kernel.org>
 <CAF=yD-JKeej85t+sCc_5K0b122uw_LiKWwX1fRL2V-QLrGA8QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF=yD-JKeej85t+sCc_5K0b122uw_LiKWwX1fRL2V-QLrGA8QA@mail.gmail.com>

On Tue, Oct 13, 2026 at 02:45:07PM -0600, Willem de Bruijn wrote:
> On Tue, Oct 13, 2026 at 2:38 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Oct 13, 2026 at 02:32:26PM -0600, Willem de Bruijn wrote:
> > > > > > > +
> > > > > > > +     if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inner_nh,
> > > > > > > +                                            inner_proto))
> > > > > > > +             return 0;
> > > > > > > +
> > > > > > > +     if (skb_is_gso(skb))
> > > > > > > +             return -EINVAL;
> > > > >
> > > > > This is a risk the commit message will have to call out.
> > > >
> > > > I tried with this:
> > > >
> > > >         > > > We can't easily "complete the checksum" for GSO we don't recognize - GSO
> > > >         > > > assumes knowledge of the protocol. We could segment ignoring the
> > > >         > > > checksum then do whatever csum_start and csum_offset say, but that
> > > >         > > > seems like an overkill for something that should happen.
> > > >
> > > > I guess I can add a more detailed explanation about what the risk is?
> > >
> > > Let's just explicitly mention the consequence: non-standard GSO
> > > packets that previous would be sent may now fail.
> > >
> > > >
> > > > > I don't see a simple way around it. We discussed segmenting here too,
> > > > > but that requires intrusive changes to all callers too.
> > > > > Alternatively,
> > > > >
> > > > > 1. call segmentation, but only to see it remove the SKB_GSO_DODGY and
> > > > > thus verify that the TSO/USO packet is valid. Still drop otherwise.
> > > > > This also does not add overhead, because it would be called later
> > > > > anyway.
> > > > >
> > > > > 2. a failsafe off-by-default sysctl + static_branch that skips the
> > > > > drop when set. Messy, but so is the situation we're dealing with.
> > > >
> > > > Tack this on top or do you feel it's needed straight away.
> > >
> > > Not urgent. Can even wait until a report appears. But worth taking a
> > > look sooner if either of us gets around to it.
> >
> > Maybe if people intend all this for stable, I'll feel safer with this in
> > there.
> >
> > Just to make sure, the branch would just short-circuit all checks, yes?
> 
> Ah option 2, the failsafe? At least any new failures (GSO) that could
> cause regression reports. Operating entirely as before this series
> sounds fine too.

Right. I feel 1 is just as likely to cause regressions. At least 2 gives
us exactly legacy behaviour back.

-- 
MST

