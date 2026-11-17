Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929589;
	b=A2jKcBMTrap3pXSBZ99xVKBtP5+UbGFU4gXwJTsBFwWn3HwrOC+AMPACoHju0aOHXl9s
	 AcK7EnzczMwdz5IXdzQiZrjuJZcZj4OVoHaF2FyDQo7U1uDNheY2YFWXXfJI1uA++Ei7f
	 mkVamWKpK6QM0rWwKdmQGzElGSvCHucDradKAKDE6czvFTvGj7vXX+buGnTPAEG8eyJaL
	 q2Xgci0MCEi+kld6/zNNfo+spTDSDtTIgpcpCLoyFntAliQisIwJ2wkTyHzkj/hamaYmn
	 P1KJe3C1x7rqLiTW8EYtiAmdNO2PjgAVxEov/6EWluLXzZKIvgmNNkXb5DxTorVKSWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ic0ZV2l8vdmrXTqu+lMUrh7Ne4ma2q8MNEr28fS3hxw=;
	b=OOuBJkj99K/ru0jFmmFEKUyA+j5fobTU4u2e4cUT2G7zKm+lcfY4kuDoEbxjwjOKzAZ8
	 SCe7yj8IHc/8ybIVylNXsFjJOdUoTUXCUINIuu/zQ2DLzA8kB0wMrqTA58Gr7mt+Lzddr
	 Uc8IbAHbj3ZLE15S8Kwcp3XkmHixlHYc9knKc0PwX6Xs1qt/ZjKTL3sBowkQek5uWEi4O
	 nBsHds5lEzH9r0K4lzu1z2/4J4HifFLugaNrQPV6BYSmKxGRQFIx9yQYLm/IAfSkA9gHY
	 YrZXk+TeZiJkPOyo4rAxeYOhCDmXZExG7GfRHc0XXnbvFOFRZz23+WCRxZj6elwFnqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Nq2As/OY";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB5606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CB5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Nq2As/OY
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a05b210703so2205640b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1794929588; x=1795534388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ic0ZV2l8vdmrXTqu+lMUrh7Ne4ma2q8MNEr28fS3hxw=;
        b=Nq2As/OYS8Rk/AJs+LfYrpJSfF6Buvx+xKdbIX4flq+eZrRjURbUNWDmvARrjsOMyp
         G4Gx7PLMS4t+lD5oQcYMVZipAItazYPQ/M4meWE5SJxFxatVGe9ROPR8uYtsVXSKDFFO
         ktD3ViGsehj7fvmOS+rsJFzMQP/LL7SrApPeoCrIZkRytaDjhZQ0X7IYsR5XOepFhFt+
         JKJ3eI8Od+PvKhxlcvAMz0AvFtM/rG8vP7w8MNFXVtYOsThIy0qp3z1ylgviHTV2ORwT
         6txojRUx4fE/Wz5UNh/Mhq0JSCVkqHb7tGYrHXiJfW2XoLH9t7s6zh9hLk+TgqK7sshF
         VhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929588; x=1795534388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ic0ZV2l8vdmrXTqu+lMUrh7Ne4ma2q8MNEr28fS3hxw=;
        b=WUH91kTzDZzPaagIVDafdUOqIvQg487gOlMs4DjE08eNODtPLX8VikscBQh6b5OwRQ
         nS+J+KCUrVxVzyCKmoUMvYKKAlS1q+BXP2CQoE4pNJINKaTlFIEJvfYefGNWw5Gisjtl
         Zngvl3JeVvKsSuGIEpG0R93kWnQ5C9WX4aK+XYVHy65yE7eNjUZETJa9uCi0S+5Y5orc
         /6llJKwIelRjKqjplberXry/LCLjQGvMigk2FLuM3r+fbhVVYMX36RDc6Gx3jWHqzIoA
         ZVG6/FBrmYoqxge+iIJj+L9mERdjFf8V3O+Eq6p9iiRyU20RlQgOzETTx+Ew1Cne6mKK
         iKbg==
X-Forwarded-Encrypted: i=1; AL+hErHbYK/HSh3RBzHWtfnTcoGMsUTOh1wH7PG5vX23fBqd+DqBGbXb4f7U12QL1BhnGooikDPd4EIZ/w8TUeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bk9Z7PAj/Qc/epkdbMq2KXDNl9rkJWJyOGwHFpSBlutBQH/Mu
	0AppbEW+0peEcqYFPbB11yqC3y78bgwReAMCQoBk74OYpkJP1uNCRoSDsKdd0WLMSxA=
X-Gm-Gg: AYBFou3CKVAuoECynDcsFzqJ5Hotc2ML7ae8SFGzX65hwsKK31FNpFjsNKtFRoFcfxt
	MoqcSlNNMmrYvzotSbeDzC7kspF7jSWjySt5rIgq1pUBAmpGN8Cb8qzjG5Mv5y1NnGs1zqYQQNC
	vb7t6s3Wo4tB5aUSVWc8dRWh//TZYP5VOXYLrVvKWDyOhBFkHWJm1tsFSxydoVaYtCZwb1wMtpU
	ztvKUQJizAITp6nYT9NjNnYK9gfak0Wy9YGPSaASmlWUf1hx7VupW53GvsMkKFaU8uiJJ7AtqfO
	HogrYvm0FeyfjRZv5/g7ish1qVKwQwcc3NIA2wsMjI/mf+mICpjT/Lbie6US3cao6iBpM84nizl
	AMcnIyJGsF6nW2eiVZ3woQ0OEl9K822DRaj63NDfQi/ZogZwNHABrOKr372BpGTXlW7U9eg2i0N
	2++F9HdcVg/WZ0QXOe/5IRGPEzuZmndJ5IzEUQ4rV3JKbA3XI/kUJEsr0I6i21VtrhsSC9lxSS1
	hKPzu0V7qFg6AokpdqIU0HrLwn9iIEMaC0VICYhYeUbgb2blLwMy6cfCqLztFKpd0+fJJev0r0B
	1qjgMdfkRSgN1sJj8hpxJt6cklpFm4MghPo1x6kSMA==
X-Received: by 2002:a05:6a00:17a8:b0:8a0:70ff:ab2c with SMTP id d2e1a72fcca58-8beb7e12866mr12534223b3a.57.1794929588396;
        Tue, 17 Nov 2026 07:33:08 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8f63sm5517226b3a.9.2026.11.17.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:33:07 -0800 (PST)
Date: Tue, 17 Nov 2026 07:33:06 -0800
From: Joe Damato <joe@dama.to>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net/mlx4: flush pending doorbell when
 dropping a TX skb
Message-ID: <avxzsj1Ro8Mzazmz@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Daniel Machon <daniel.machon@microchip.com>, netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	edumazet@google.com, horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org
References: <20261110231304.1859217-1-joe@dama.to>
 <20261110231304.1859217-6-joe@dama.to>
 <20261112134346.zvctvknj4mc5s2pm@DEN-DL-M70577>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112134346.zvctvknj4mc5s2pm@DEN-DL-M70577>

On Thu, Nov 12, 2026 at 02:43:46PM +0100, Daniel Machon wrote:
> > If mlx4_en_xmit drops an skb (for example because DMA mapping fails) and
> > that skb happens to be the last one in the batch, the doorbell for the
> > WQEs posted earlier in the batch isn't written.
> > 
> > The queue stays awake, though, so those WQEs are eventually announced to
> > the HW after the next TX, but that depends on traffic and could induce
> > latency.
> > 
> > Avoid all of that by writing the pending doorbell in the drop path.
> > 
> > Signed-off-by: Joe Damato <joe@dama.to>
> > ---
> >  drivers/net/ethernet/mellanox/mlx4/en_tx.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> > index 123071a47bed..3166837711be 100644
> > --- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> > +++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> > @@ -1135,6 +1135,9 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
> >  
> >  tx_drop_count:
> >  	ring->tx_dropped++;
> > +	/* an earlier skb in this batch may have deferred the doorbell */
> > +	if (ring->doorbell_pending)
> 
> I think checking !netdev_xmit_more() here would let you ditch the new ring
> state, but it seems bnxt does it the same way, so fine by me.

I need the state for the SW USO followup I mentioned in the cover letter.

That aside, every mlx4 doorbell site today writes it only after posting at
least one WQE. I think replacing this with !netdev_xmit_more() might write a
doorbell with no new WQEs and idk if that is supported by the hardware. It
looks like the XDP path gates against that specifically.
 
> > +		mlx4_en_xmit_doorbell(ring);
> >  tx_drop:
> >  	dev_kfree_skb_any(skb);
> >  	return NETDEV_TX_OK;
> > -- 
> > 2.53.0-Meta
> >
> 
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

Thanks
