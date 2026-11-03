Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793694811;
	b=mULfJDKUIus+N4N2PrNKkvBvVAawtBzeb+4N3DG9lzxbH5pw8W3htkiFEZmIr2EgvJhE
	 eF6Q0tn6Dq1CfChNyucgQS2pH+oH42MA+N9QNIiUmtX9oYk12QqOWmDR+fEgCyXE84S/Q
	 0v0H+hl34jAXCoKO4n3+IFRwnuEYNGb04yk2ZExcbprvCo7hAvS2T3wzsDqQMYufl/52B
	 sLlnpGi1oGFt6VwJwewxVh1HR3okNFZqxcaPP6dY5FfvRGIQSkazS6LyyBeng4L5sAv0K
	 t2wS/jGZBVWbWQI5BaJVaoCernOZ6xHR42rTIXE35kHF99idLRj1DH1KQ6a/RCazQoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ns5UrpFr+nBqk8VeozAAQ/bQgy/bCK+3qJvpw6jQboQ=;
	b=D6qUJVsl/ySon3RV/BOPw9TAFJ2fK3rvTzAK/8hq1BW+LImGnyQyz6zhGKxgYGurRzvF
	 ngsJwjitFVQDJPyoP0Sg+gUnr+YGmGJsabM5855ctTnMhwvTEU4itHAPWRi3uuYsvVldv
	 fDXNXkvkiFwJA+M6Eud3CBdIv1P+kRn86x3a2A0knBJw65Pic6xl2WTHvigTCCDyh20BV
	 0C/EJRv/MT2RXlWmppa20n+BSr+U3t5b6UxI/hw/byG0zeylV0UH9zRfjeNW2q3nv5eWx
	 UVelm6zICdikOnFB10Yc25JjrGONroIFzZzbpA+BHFFr5YIHTWEG0ym/Pnd2YbzzwMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="d4V/cwWM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39782606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39782606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d4V/cwWM
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e95bd1c14cso35464685ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:33:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793694810; cv=none;
        d=google.com; s=arc-20260327;
        b=T6ppKpu0mUbuIi+43E5LB7QqU/ex2tZjDNOho7dWCtaxCdwTnz930zQihK2fSt/CqI
         dKcbf4NhztLVUMgc1VcOVy62fJPkI/mA63pzF4loNX/LGhHo5OtmWSmLK1iVqri1J3r9
         PJToEGQMJ3wDdAG82osupnQ8EGXKuxDZUJ38jZ0mbRNTxijPoUzJbWRDHAhtPBMkdm7L
         3iY1843Ztn/sbsZ/ABJ8GlVkD8dRF/7EPcNWnM908JGwcIdu5nIdGDDSOpzSwjQicNoc
         iPFuiPjUzlNxWsrijWAzAC/V8FxrqGiESyNOavgdQ0Y6Ucc+abJRlW25/7zGLSPRJ5L7
         7rIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ns5UrpFr+nBqk8VeozAAQ/bQgy/bCK+3qJvpw6jQboQ=;
        fh=/xvIZJnbct/ycai7BGMHtN7J9rl37rSg0W9NVjIWrEk=;
        b=JNhml+TD/iI5Y9/LO9gp7as6HhMLJfez4J/DHwO9NhKlVOP8g+Uv/oZODEpFchNTDR
         Ard4ul+FEZRxdqWTtWbWnqLv1n5AYn2LRzE7HAD5zUF3F8OiiU2lFWe7z7lUnsIWCV+E
         sL6e/b2GPu4cJTWJ3opoIdWKS+zojNL8YL0ZJZ9auOklWoQoc0nVXqSwtGBzl5vMLn+d
         +msmyb+/eL6jG3ExdlDrxh3HVmFMH1jgbmU5NEuA4nazIWZg/awWn4jBzjgaiYiyOU9G
         qcb0fHx37NFyWyYPypyF+3iHqks31dLa6I0UCqFAg4reKHyhxelPD8+D9zZ+0Bt1jUWU
         jdCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793694810; x=1794299610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ns5UrpFr+nBqk8VeozAAQ/bQgy/bCK+3qJvpw6jQboQ=;
        b=d4V/cwWMXr7n6exLZLA1MpGqLFb3geTN023uWwcKZA3/hpIRx8OHoTvQ9ri2Pe8SE+
         8JCRsjlAyliZR9iF6Tu5MqDeAPS9caRk6SyULSMZUavYoiXfGNwRhsjEJ1vPqKGh1I6R
         2PfbEERtyXgZglZ5k6D4pAdMUB+hrBF4VkNm3YkOtvupEr9O7G85Gu7V3RJEDxEf0ddB
         AJwLGe2OnNOc6kPro4NAubMZr0fh82ORA2DYIpAkkDBmfSZMqprADjxSUyfNBlIhYwLa
         eP/aM1Sn8q2/EPPapW+a8N7RbOSCx4Sj7fZXTEYw9lRkx5lSwrmvpniLFM8p2Fh4MYOv
         /n/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694810; x=1794299610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ns5UrpFr+nBqk8VeozAAQ/bQgy/bCK+3qJvpw6jQboQ=;
        b=A96kHE+Wf8moMrAZYGo4eiuECasc9I4CswHG6JKsJ+sxK9S/VYeCj24f+UsdW/R2qj
         9r5Woanxv7XErgNioJGa7iI3n2NVektvHbikfVo5i+spTAY1GSxJka9Luki7mVJDg0mY
         VOOmwsxzzIhT7lILdShMysU9f94qBKVtNjTGXop0GfN5n+a3e0uK1yj4+t+hu1ProiBw
         kjWMzeaXhZpEcWuIFiwPm3nPCuNk0/DL2lBX9RfHrwqMYQJ05fHKnT+Y2YaWBgwRMsmy
         p7CcNPIkZ+GY7yVkXiZ7cnaCSdnlsBIUzFzGJPOAFSj13eKnXXxbBHdKic6c8GMeouvn
         MXPg==
X-Forwarded-Encrypted: i=1; AKwUvByagcAkfgmFt/5isHZ/qIEtFeYL2vuPknTC8za6f7d/WJhNF4mAHMl4pDVG5v6C/pnbLiQflRjQjrdoZdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rxBE15Zm1Jp22hDg7HYd0U3Y3+ZTlzTyFrKGYmR41l3p8STBF
	ISXk5hNm6J7yW4ht3T7zm9omp9VB9PpSJ9R++DUWLnaOrFm2i23UZ/8Gyi3FeK9ZulyPUXuPv1g
	Vg4ZB+5UqWuh4rZLUWRqJ3hpsga6KgPbLJ3RBkqFl
X-Gm-Gg: AYBFou2jBy+pKTaqAYq4OiQlj6gyirMPnHqLbSv8Na5m/N+O+tuVGwhaboaPZK+rx08
	vIAQwDbgwmJaPUHnFaVppfnIcELeTqlCcWW4rEPdd6o/QEPnp0v42hQoNCRG+0zqOinctlgS24y
	QiUSPHOOpXKW6QtINw1flCNFXWKn93yfr0sstJ0vY2Vzn4kusmxW8dok/wA2SM5CNM1UKTxBFAW
	jtobRZ6gBugdgfU5fYicLnbJYsGZuSg6IXtPyIa59DWxVOb5yi3cE/+YKrW5rvKbwxiZZPtWMba
	2CUcHCXVLP3UKQf4kl2fRiNVFfZwnbidphY/SWROVhuc/04iUGL3iSb2TG24xbCsDeYlp2wk6OI
	cwvBcO8lXCzQ7bxXOSOGk33bVEYorHfeykbNG
X-Received: by 2002:a17:903:1c1:b0:2e9:6333:fbb8 with SMTP id
 d9443c01a7336-2eb364936fcmr122129865ad.12.1793694809842; Tue, 03 Nov 2026
 00:33:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029211634.2232784-2-hramamurthy@google.com> <179365431852.3131.15974768163319773656@kernel.org>
In-Reply-To: <179365431852.3131.15974768163319773656@kernel.org>
From: Pin-yen Lin <treapking@google.com>
Date: Tue, 3 Nov 2026 00:33:18 -0800
X-Gm-Features: AclHuK822Wf9DTeUoa6mUrIKemK_tfGKzjcfqPnGUM0p_VrNgJWlcfcDSwcas6o
Message-ID: <CAHwYsirZ8CpNL4QA_ie9EX6WCs=Waq9F3JsPXL+LYPjx=RJ7ZA@mail.gmail.com>
Subject: Re: [PATCH net v4 1/4] gve: Fix race between stats query and queue reconfig
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

On Mon, Nov 2, 2026 at 1:18=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] At this commit, the new priv->stats_lock is not taken by the
>   single-queue (queue-mgmt API) writers of priv->rx[idx].
> - [Medium] At this commit, the device-level qstats totals drop to 0 once
>   the interface is down.
>
> --
>
> gve: Fix race between stats query and queue reconfig
>
> This commit adds priv->stats_lock to serialize the stats readers
> (gve_get_stats(), gve_handle_report_stats() and the per-queue qstats
> callbacks) against queue teardown in gve_queues_mem_remove(). Queue
> pointers are now cleared under the lock before the ring memory is freed.
> The per-queue callbacks also return early when priv->rx or priv->tx is
> NULL.
>
> > diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/e=
thernet/google/gve/gve_main.c
> > index 2437cd8ba6331..26fdd22644f4d 100644
> > --- a/drivers/net/ethernet/google/gve/gve_main.c
> > +++ b/drivers/net/ethernet/google/gve/gve_main.c
> > @@ -69,6 +69,7 @@ static void gve_get_stats(struct net_device *dev, str=
uct rtnl_link_stats64 *s)
> >       int num_tx_queues;
> >       int ring;
> >
> > +     spin_lock_bh(&priv->stats_lock);
> >       num_tx_queues =3D gve_num_tx_queues(priv);
> >       if (priv->rx) {
> >               for (ring =3D 0; ring < priv->rx_cfg.num_queues; ring++) =
{
>
> [Severity: Medium]
> Does stats_lock cover every writer of priv->rx[idx]? The single-queue
> restart path still rewrites the ring contents without taking the lock,
> and priv->rx stays non-NULL the whole time:
>
> drivers/net/ethernet/google/gve/gve_main.c:gve_rx_queue_stop() {
>     ...
>         gve_per_q_mem =3D (struct gve_rx_ring *)per_q_mem;
>         *gve_per_q_mem =3D priv->rx[idx];
>         memset(&priv->rx[idx], 0, sizeof(priv->rx[idx]));
>         return 0;
> }
>
> drivers/net/ethernet/google/gve/gve_main.c:gve_rx_queue_start() {
>     ...
>         gve_per_q_mem =3D (struct gve_rx_ring *)per_q_mem;
>         priv->rx[idx] =3D *gve_per_q_mem;
>     ...
> abort:
>     ...
>         memset(&priv->rx[idx], 0, sizeof(priv->rx[idx]));
>         return err;
> }
>
> These run under rtnl and the instance lock. gve_get_stats() (via
> ndo_get_stats64) and gve_handle_report_stats() (from the stats report
> worker) hold neither of those. They only take stats_lock.
>
> Suppose a devmem, XSK or page-pool queue restart races with a read of
> /proc/net/dev or with the stats report worker. Could the reader then see
> a partly copied or zeroed ring, including its statss? It would then
> report torn rpackets, rbytes, desc.seqno or fill_cnt values.
>
> The readers only copy scalar counters, so this looks like wrong
> statistics, not memory corruption.
>
> The later patch in this series, "gve: Fix backward stats when interface
> goes down or configuration is adjusted", wraps these writes in
> spin_lock_bh(&priv->stats_lock). This patch is tagged for stable. Would
> it make sense to move that part into this patch?

Agreed. We will move the spin lock to this patch in v5.
>
> [ ... ]
>
> > @@ -2786,9 +2796,15 @@ static void gve_get_rx_queue_stats(struct net_de=
vice *dev, int idx,
> >                                  struct netdev_queue_stats_rx *rx_stats=
)
> >  {
> >       struct gve_priv *priv =3D netdev_priv(dev);
> > -     struct gve_rx_ring *rx =3D &priv->rx[idx];
> > +     struct gve_rx_ring *rx;
> >       unsigned int start;
> >
> > +     spin_lock_bh(&priv->stats_lock);
> > +     if (!priv->rx)
> > +             goto unlock;
> > +
>
> [Severity: Medium]
> When the interface is down, this early return (and the matching one in
> gve_get_tx_queue_stats()) leaves rx_stats and tx_stats untouched.
> netdev_nl_stats_add() then skips them as NETDEV_STAT_NOT_SET. At this
> commit gve_get_base_stats() still reports zero:
>
> static void gve_get_base_stats(struct net_device *dev,
>                                struct netdev_queue_stats_rx *rx,
>                                struct netdev_queue_stats_tx *tx)
> {
>         rx->packets =3D 0;
>         rx->bytes =3D 0;
>         rx->alloc_fail =3D 0;
>
>         tx->packets =3D 0;
>         tx->bytes =3D 0;
> }
>
> After some traffic and then ip link set dev down, does the device-level
> qstats total drop from the live counters to 0? That looks like it would
> still fail check_down() in tools/testing/selftests/drivers/net/stats.py.
> That check requires every qstats key to be non-decreasing across ifdown.
>
> The NULL dereference is fixed, but the totals now go backwards. The next
> patch in the series, "gve: Fix backward stats when interface goes down
> or configuration is adjusted", seems to fix this. It folds the ring
> counters into priv->base_net_stats and priv->base_ring_err_stats in
> gve_queues_mem_remove() and reports them from gve_get_base_stats().
>
> Given the stable tag, is it intended that this patch alone leaves the
> qstats totals non-monotonic across ifdown?

Yes, this is intended. This patch focuses on fixing the kernel panic
and the next patch addresses the stats values across ifdown.
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261029211634.2232784-1-hramamurthy%40google.com

Regards,
Pin-yen

---

pw-bot: cr
