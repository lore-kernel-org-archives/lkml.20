Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793112711;
	b=Vyh5LZjILCxo2Fv7z9Iy4PBMZDzjq+vyBAdHxbFfgqYB6XDEAI7eqSeINQrcQHlHoBkW
	 lrywfAanrYBaK/p6xx3GFcP9/q8WbieUWdVv/mPeX68Kjl5Zq4amyz+a+escFYjK2+9sx
	 Rn4CnhOw/SYZPnd4mvdxwne5NIqfoJFIGA1UhMa79dQ0zdSxjEOWtpc0/XpHxGdoqKO9Y
	 d7jOxpltr70bpT1Vxs1z/trUWzXoaZZYi5HMMHSu2PGYwH0vcMWs6DD7goYNvdr+1kwXd
	 A/wE5KLejkCnHis3YnH+7Fiw2d1+Q/X0tqq24DZpg6HFiGTWCyS5KEMeivzsNW9aD0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OKc4Bh4uFk3DkEm+qqx5OjnbVTtIfi1KH/DJQhTslQQ=;
	b=Wz5yWQHmNkHiMkxDp+lD5+tnZSMMIh2YLPU6IfZBGPFa5nLXmzYX5vcyQnUuep8JhR2d
	 8Bp3BOwIDSmM3vplvqnxXuh1mq33dDkpenEWVKUE2s0A7qX/xyCl2VK3+dSED+sSIQKQP
	 m0nMLhDWvbvNJIpqa2Fuz2y0V1GaPVcm3LmAmUS6k9t0xdKoahtkZFFuzB2AgJaz5EddY
	 MTdIQUb2tFNnbve0Ir2KsKfSJh8LCub79CWDzw3IIlhBq7kNdNyROoxURHfd9ECJwu1Te
	 LjExxBXXxnmrb3icfx3cYKATkxU28XxrDvN8y8Awfyk2F68d8XRRO4eE/GIiLgkWpqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jl3jPQ3D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0FE606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC0FE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jl3jPQ3D
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so3175694a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793112710; cv=none;
        d=google.com; s=arc-20260327;
        b=aAV+HpQxZSdbxqNEUKBtMaV5CLgreJAKAjMD7/S23Z8myHWc9zSqUh7SkhZ1NBW8LP
         LX5wsJp+DkE1TDa/VckCV88OlVjK87DAWuaNv5GWQY7agKl4iIHlYlkjdAsVjPBcv4bc
         3ljPMoHZhSPEX2CxT0WJVR0eHXVJh0P89t6utUYLJ1oz21bmnnvpJJBRjrEAVL0hECHx
         O9lkncQFXAIWUO72C8pmr9JMIpGJWMue0LlmOOzbgj2lHm7y+veS4Z/ThMzBBx65R9aS
         XL34hKPMfO2w02pJzacOaBdDZv6Cf/E5V67KCw6WgBZf5yS6IoX684XKdFNWW1RaAPla
         ka3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKc4Bh4uFk3DkEm+qqx5OjnbVTtIfi1KH/DJQhTslQQ=;
        fh=/vP6E5rQ7ZJd6SFW4qfdrQIa3wA6yQo1cLPhNo+RY5w=;
        b=TnjjfJ+fjnW1Kp/wMMrsXVMdclmGte2Q1Rnb43NoIY+HwjWFyFgK0YCTMevExUkEKJ
         NeYvshb0D4zEzUGjU0w/alOrtCoTex+pjXVFdN5gudDz5TR3sWtvFt1HVnN+vbB0Zg4C
         JqTEqKQia5j40YCqND4GBICdoaTh4wStYsckhhJ2cmQHA8PwlSDdkN2xL6pxU7sc6aHN
         +ujHfgb3St+vLbCgFyTDeYnJB28UVxBlfSVva62e6E1bqJGmbVG50hit0H0M68KFok5S
         6ZEi9ezJqXGWQDEh7PmP6hg7rsH8B4PDJB9fcRS3H0/1yR1zcuZpKO9vGXz/dL98BteX
         7Qog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793112710; x=1793717510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKc4Bh4uFk3DkEm+qqx5OjnbVTtIfi1KH/DJQhTslQQ=;
        b=Jl3jPQ3DUZZn2ZfL42bDRJ7yAwcT8Z87mlygeaL9LSUUXxJ8fiW1Y+oKIHYWxeWxhA
         phw9fDYNGxv5zcJTemASKS7/Z5I9hIwQkxfdi3kqE8ibg0HMUcOq1019RKKOL50P433f
         qUDe2PmN0g9N2JH+Zt36GH07pOAlEv1qEDHcLd+nAQ4X9ej1MG5NNh4YSYl6A3q1v/aY
         N/fxwl2pzaQEnAUmqcRe0GRxPDc7jxvUi80PjRpNwvaRgRL2zp4ziV2AZzRCzLFa918W
         obA39r/1Q3K2/sSKM1nELt7Mx6G/JH5zVVerDILoycvSxKFRoS8YvNTKQMIBY7mX8cBY
         0fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112710; x=1793717510;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKc4Bh4uFk3DkEm+qqx5OjnbVTtIfi1KH/DJQhTslQQ=;
        b=s1gX9gp/ne/RzQWxCTj0nmiOnNmc0bYd07IckEd/PsIwMjnubJcSW7mGzzEU3xNU64
         8KFUuInXgcWvb2iwu1vb5/LiYPfKsXKqtIhaBKGxwc8Vt9nc75P1HThMS7vn5Gavo/CG
         Sx4CP7K8c8396OUpS7f07zwV3y4JUwvt2yEZB1oA06U3mehRgEeu6vVvM7edQric6O8C
         aCjQNbZJlByB8e+Le1iZQ8WcC4n7VHLPKYgIm+ilQ+GFgCV/l0vghFBU1Frk65mBOPLk
         w1iohG961TOMVQU1cW8FmuE1IZtxTajPus7kTFIH2dK+gjxqnF+dgFkzF4VsH/zgOqPu
         wpIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0Fxt8gnxWvgvY7nVpfgu9EsnjHl3MmWFmkq+6KOCdeK/v1tda4oIRTauz34NAg5GpxkNewLXSrjH+EL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJygEhLvBRsTv9GdfGLen9zyMHQ6yCqTNdUVtPsbY670hRuItvu
	bs19/IJ9mN807ES+TWCB8EYZvnLLTzF2OdzdtsvCHGRYHhYH/SdhntmpyV5+YxJqf4A4/y9Zdkr
	kCmp4mlM16il8dSY72nLD2kc7YQYX47ZewFHAn3sK
X-Gm-Gg: AYBFou1cBohMp0M0XNBs0xV54GE+8BKHsG+95wzXDSirvnsLQYJfxuf6KFaar2IruT9
	3OklWgDcYWeh67TOeDJO21OciTDoNhgMR7N6quWrhxQdBDIu3el8b3GXSpblv6iYtfn0Y2JWCbb
	wG1lJaG0HS3vhBX/URHpJ5fYGDUIxzEB/J2rONfYq0wCKMe4OCqGLtrdoDn9QAgwtxeyKKlD9FA
	MWJM344cOLIJboCVJo6BWPZuxYHlEQ2mdUOvf7+Zoe925GutgkuYV4VTNezusXgtODWkU/z8QB2
	jqQanP8888C5hjcDx1e6Gh7JPjeTFFFoUyy4r0lLRHS5x5sDwraGnvyou9mTW2NJBUU8sjb0Q11
	VRAYKUK2Ozk3jNjKL1ta7P4GXAfUUCpHVs4b34nhBrdMuJozRB6R6nTm3d6tR97eeVDbk1wg=
X-Received: by 2002:a17:90b:5105:b0:3ac:9176:e81c with SMTP id
 98e67ed59e1d1-3adeae76765mr8659776a91.46.1793112709541; Tue, 27 Oct 2026
 07:51:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023204706.3112215-3-hramamurthy@google.com> <179306532583.3134.7567788102217743644@kernel.org>
In-Reply-To: <179306532583.3134.7567788102217743644@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 27 Oct 2026 22:51:37 +0800
X-Gm-Features: AclHuK_r134DQq9f-MM94YPe5SSEL_CL1JSycuvsAHgd8vqn87yNzLMk2J92-zA
Message-ID: <CAHwYsiq0v7yLAjh6fkmhckZHL4q80BOk9fVT1chuXwk_kGt8Cw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/4] gve: Fix backward stats when interface goes
 down or configuration is adjusted
To: netdev-bot+sashiko@kernel.org
Cc: hramamurthy@google.com, netdev@vger.kernel.org, joshwash@google.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, jordanrhee@google.com, willemb@google.com, 
	przemyslaw.kitszel@intel.com, nktgrg@google.com, maolson@google.com, 
	jacob.e.keller@intel.com, pkaligineedi@google.com, yangchun@google.com, 
	patricion@google.com, awogbemila@google.com, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:42=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] When XDP is attached, the new base snapshot counts XDP TX ring
>   traffic only at teardown, so device-level netdev qstats tx-packets/tx-=
=E2=80=A6
>
> --
>
> gve: Fix backward stats when interface goes down or configuration is adju=
sted
>
> This patch keeps baseline rtnl and qstats counters in gve_priv so that
> device statistics do not go backwards across queue teardown. Ring counter=
s
> are folded into the base in gve_queues_mem_remove() and in
> gve_rx_queue_stop(). gve_get_base_stats() now reports the saved values
> instead of zeros.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index 26fdd22644f4d..52c152a986eb7 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
>
> [ ... ]
>
> > @@ -646,6 +688,9 @@ static void gve_queues_mem_remove(struct gve_priv *=
priv)
> >       gve_get_curr_alloc_cfgs(priv, &tx_alloc_cfg, &rx_alloc_cfg);
> >
> >       spin_lock_bh(&priv->stats_lock);
> > +     gve_get_ring_stats(priv, &priv->base_net_stats);
> > +     gve_get_ring_err_stats(priv, &priv->base_ring_err_stats);
> > +
> >       priv->tx =3D NULL;
> >       priv->rx =3D NULL;
> >       spin_unlock_bh(&priv->stats_lock);
>
> [Severity: Medium]
> With an XDP program attached, will the device-level qstats tx-packets and
> tx-bytes jump forward on every ifdown or reconfiguration?
>
> The TX loop in gve_get_ring_stats() goes up to gve_num_tx_queues(), and
> that count includes the XDP TX rings:
>
>     return priv->tx_cfg.num_queues + priv->tx_cfg.num_xdp_queues;
>
> As a result, the full pkt_done/bytes_done history of the XDP TX rings
> ends up in base_net_stats.tx_*. Those counters are updated by
> gve_clean_xdp_done() and by the DQO XDP path.
>
> While the interface is up, qstats never reads those rings live:
>
> gve_queues_start()
>     netif_set_real_num_tx_queues(dev, priv->tx_cfg.num_queues);
>
> netdev_nl_stats_by_netdev()
>     netdev_stat_queue_sum(netdev, 0, netdev->real_num_rx_queues, &rx_sum,
>                           0, netdev->real_num_tx_queues, &tx_sum);
>
> So gve_get_tx_queue_stats() is only called for the non-XDP TX queues. The
> new gve_get_base_stats() returns only the saved snapshot.
>
> The qstats device total therefore leaves out live XDP TX traffic. Then,
> when gve_close() or gve_adjust_config() reaches gve_queues_mem_remove(),
> all of that traffic shows up at once. gve_get_stats() counts the live XDP
> rings the whole time, so rtnl and qstats report different totals while
> the interface is up.
>
> The netdev_stat_ops kernel-doc says get_base_stats "can also be used to
> report any miscellaneous packets transferred outside of the main set of
> queues used by the networking stack".
>
> Should gve_get_base_stats() also add the live counters of
> tx[tx_cfg.num_queues .. gve_num_tx_queues())? The other option is to
> limit the teardown snapshot's TX loop to tx_cfg.num_queues.

We will make gve_get_base_stats() include stats from the XDP queue in v4.
>
> > @@ -2844,12 +2901,22 @@ static void gve_get_base_stats(struct net_devic=
e *dev,
> >                              struct netdev_queue_stats_rx *rx,
> >                              struct netdev_queue_stats_tx *tx)
> >  {
>
> [ ... ]
>
> > +     spin_lock_bh(&priv->stats_lock);
> > +     rx->packets =3D base_stats->rx_packets;
> > +     rx->bytes =3D base_stats->rx_bytes;
> > +     rx->alloc_fail =3D base_err_stats->rx_alloc_fails;
> >
> > -     tx->packets =3D 0;
> > -     tx->bytes =3D 0;
> > +     tx->packets =3D base_stats->tx_packets;
> > +     tx->bytes =3D base_stats->tx_bytes;
> > +     spin_unlock_bh(&priv->stats_lock);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261023204706.3112215-1-hramamurthy%40google.com

Regards,
Pin-yen
