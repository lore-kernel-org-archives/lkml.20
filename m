Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D40C4E021E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608246; cv=none; b=pSLxvbA23chnbbFpONqn82bVlN8wNwFXVDCSpABpIiwQHB+BE2MDa9jMc365FuAcf7zkLcpGzYDzbq7OVPFlbtgkedF2wZEMnxtawn3/kNlZT7tVRpSiRpxVEOIGDmd6Zraw9AmOxixICXkLk1KfHP/LPV/IA9pffAgufIkxVVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608246; c=relaxed/simple;
	bh=bl3IwuCW6AmawdJ8nWbR3/O/dKwf+9Gdpx1v6y+FdoE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LctCRyTdxpzTMTNn1ueSmeFGFdzQ3WH5uw0HebTo4JQ2CLKrh6rMSacKEORCNEwiuIhdR/d3+ajNIdRWbKvuG+tkWSV1ewQDxKlRQ7SLmY85OsW7McYRGu4YVPbv5yLx5PAfS7vnqE6nYhtOCSWsuYD6rvWnOafm+2RW2nLwWdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWeXWsXW; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWeXWsXW"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-8659af7454eso34829677b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608244; x=1791213044; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sYYFoaTMRB3GOnjpaYUTL6ry/fhz19rfZ6OU5bjdLfQ=;
        b=bWeXWsXW6eombCz3QAfBsyiDlnOsxAcYvCUEgRr+1X038pc32WGhW0mKCB29z8nF2t
         N6yLFtjhCXhYa7dTMTzP/73bG10zlG9XfOAcFC9VHmYuQESIXjm43GCj5sYS+qYw6Fui
         OnIiDhMBPBPMOPR0bl9yqJjy+kHhYk1wCa23DtRha6+eLnoXwzM5WY3UgekMpXXWaB8n
         6lW+UewjHBPa+FCTPTglKD3jG9YH3ialvDqyREe14uSrLHtZytMgi3sa1Q3euLht8duA
         l+A6KOi5S0Ho8REJPcWMBCbi9riYXqYFrXOOqMxCxBljzMk1kkX4A7PwRA8F3LMoTerW
         vMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608244; x=1791213044;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYYFoaTMRB3GOnjpaYUTL6ry/fhz19rfZ6OU5bjdLfQ=;
        b=ZaKxrZ5qKxWkKYlvwwRP+yUvq1sPBaA6y65jD4ZdUtlQnRmMiZuhLSkB1APtyyIYcD
         Z3/dr+RMAGQDZkbBwrjS0IW0KTBNguHx4s92QX8Ncr5zKIiTcxuStW675wQzu9rDP8yl
         8bPudQKHwmwh7LWaFl0Vj5PnRyDnfqdMVAjgZcj4Vg8T6hocGQ565boDo4VNIFtomI1Q
         kmnfSg5NLWdIiDq2bfhSDn6gpkwjNwy5vq1xMWmmXeHdRVzhs7UUll66+QXb1/kvqpBr
         +EUm5SW8wJdt0d59gDbCjzVM1FXiZtVzc8uEVNPd7FmzcbTz3uDo8RbVUknOCye9g3D7
         ChbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+HkxNEShq/g0St7UFDS5yZsUeq3QhPNo6FML/370ZU/mhjLtqsyLTTHPXoqV48EKzNBIH4FyACGc5h98=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFKnMq9VYmPvyC8Z459lpK0CJ/UOWZ8gdMGUrjCghTCLr7pxrB
	donP+clLIoIZCpqi7WTDRxAI6ma0WtY30+4DvEC2QODEf4ftkbuiebVu
X-Gm-Gg: AYBFou2o3mNGBtlY++uUztJG91fGD1dBk/1UJFoMO7lxTVAadF+Xv2vnzIvj038OoB8
	T8Yq7fzzOZS0yQDkgZGXvXfhOQn0lKbNex6V4CmGLUJKYlupAf/33tRSPHEFHDNSQwlVAUCykld
	SzEkbDA2LYHX9/q5ZStIGkCWptmRFtzwjkWWCdRoaGqavGYx2vfxYPIUoSvHgH6192EA/b2XYED
	bi3m5kI02q4Xe4l3iB0MYTgBx4ozPoaGW33CBp9pJQChfMwMIuaiODCBLV1GUzytKSPcfZ1jvtd
	ZByha+NV/eM+a8xgQgh1g5gXwbnEcMuEyH2lkRsmD1XbW5bBv5Ej3hg9a7fsr83m2JnFXJd3uE6
	VQv02JjiLvzsaaagl2HhBtN8sWTqMW1WCa2Crhzf50YmPjOpd0d0WMuW18nFhqB9uRN8v82ltKL
	53RTdJvzaXtb/rl+iJ2v/xeQawJhJAi2qBGzj496+b6xqFEnlkUbTopDoScMmbnwXWGkYajSYFR
	cbQ
X-Received: by 2002:a05:690c:385:b0:8a1:6582:7c16 with SMTP id 00721157ae682-8a649a74b2amr70254407b3.26.1790608244067;
        Mon, 28 Sep 2026 08:10:44 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c8159a5f7sm167749685a.45.2026.09.28.08.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:10:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 11:10:42 -0400
Message-Id: <DLR1NAO40MWX.12Y7LOSUA92GR@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <dimitri.daskalakis1@gmail.com>, <mohsin.bashr@gmail.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v2 6/8] eth: mpnic: add a netdevice and basic
 Tx handling
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260924-linux-mpnic-v2-6-4badc9b58b9e@gmail.com>
 <179055370515.3145.17058486989024667735@kernel.org>
In-Reply-To: <179055370515.3145.17058486989024667735@kernel.org>

On Sun Sep 27, 2026 at 8:01 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The netdev registered by this patch has no statistics
>   reporting, and Tx drops are not counted anywhere.
> - [Medium] mpnic_open() undoes the netif_device_detach() that this patch
>   adds to mpnic_mmio_err(), and reports success on a dead device.
> - [Low] Concern: mpnic_netdev_alloc() calls
>   alloc_etherdev_mq(sizeof(*mpn), MPNIC_MAX_RXQS), which leaves=E2=80=A6
>
> --
>
> eth: mpnic: add a netdevice and basic Tx handling
>
> This commit registers the mpnic network interface and adds a transmit
> path. Each skb gets a metadata descriptor followed by address/length
> descriptors. A completion is requested only when xmit_more is not set. Th=
e
> index of the deferred metadata descriptor is latched, so that dropping a
> packet can still ring the doorbell for packets already queued.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/ne=
t/ethernet/meta/mpnic/mpnic_netdev.c
>> new file mode 100644
>> index 0000000000000..6d5007be6cadb
>> --- /dev/null
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>> @@ -0,0 +1,180 @@
>
> [ ... ]
>
>> +static int mpnic_open(struct net_device *netdev)
>> +{
>> +	struct mpnic_net *mpn =3D netdev_priv(netdev);
>> +	int err;
>> +
>
> [ ... ]
>
>> +	mpnic_enable(mpn);
>> +	mpnic_napi_enable(mpn);
>> +
>> +	netif_tx_wake_all_queues(netdev);
>> +	netif_carrier_on(netdev);
>> +
>> +	return 0;
>
> [Severity: Medium]
> Can this undo the netif_device_detach() that this patch adds to
> mpnic_mmio_err(), and report a successful open on a dead device?
>
> Suppose the device goes away while the interface is down. mpnic_enable()
> ends with mpnic_wrfl(), which reads MPNIC_BDQ_SPARE. If that read returns
> all ones, mpnic_mmio_err() clears uc_addr0 and calls
> netif_device_detach().
>
> __dev_open() has already set __LINK_STATE_START before calling ndo_open.
> So the detach clears __LINK_STATE_PRESENT and stops the Tx queues:
>
> __dev_open()
>   set_bit(__LINK_STATE_START, &dev->state)
>   mpnic_open()
>     mpnic_enable()
>       mpnic_wrfl()
>         mpnic_rd64(mpd, MPNIC_BDQ_SPARE)
>           mpnic_mmio_err()
>             netif_device_detach()
>     mpnic_napi_enable()
>     netif_tx_wake_all_queues()
>     netif_carrier_on()
>     return 0
>
> mpnic_open() then wakes every queue again, turns the carrier on and
> returns 0. The interface ends up IFF_UP, with carrier and awake Tx queues=
,
> while it is marked not present.
>
> Would mpnic_xmit_frame() then keep mapping skbs and writing to the cached
> ring->doorbell until the ring fills, with nothing ever completing? The de=
v
> watchdog would not fire either, because it requires
> netif_device_present().
>
> mpnic_netdev_register() checks mpnic_present() before register_netdev()
> for this same reason. Does mpnic_open() need a similar check after enabli=
ng
> the device, so it can unwind and return an error?
>
> The version of mpnic_open() at the end of the series only adds
> mpnic_fill(), so it seems to behave the same way.
>
> [ ... ]

See my reply in v1: https://lore.kernel.org/all/DLNQX7U9QRFW.2G0KYKS5W3X3H@=
gmail.com/

>
>> +struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
>> +{
>> +	struct net_device *netdev;
>> +	struct mpnic_net *mpn;
>> +	unsigned int queues;
>> +
>> +	netdev =3D alloc_etherdev_mq(sizeof(*mpn), MPNIC_MAX_RXQS);
>> +	if (!netdev)
>> +		return NULL;
>
> [Severity: Low]
> alloc_etherdev_mq() uses MPNIC_MAX_RXQS for both the Tx and the Rx queue
> count. Only the Tx count is trimmed later, in mpnic_netdev_register():
>
>     err =3D netif_set_real_num_tx_queues(netdev, mpn->num_tx_queues);
>
> Doesn't that leave real_num_rx_queues at 1024 at this commit? Sysfs and
> netlink would then list 1024 rx-N queues that have nothing behind them.
>
> This looks resolved later in the series by "eth: mpnic: add basic Rx
> handling". There, mpnic_netdev_register() and mpnic_set_netif_queues()
> switch to netif_set_real_num_queues() with num_rx_queues.
>
> There is also a smaller point. The Tx queue count comes from
> MPNIC_MAX_RXQS, but mpn->tx[] in struct mpnic_net is sized by
> MPNIC_MAX_TXQS. Both are 1024u today, so the
> mpn->tx[skb_get_queue_mapping(skb)] lookup in mpnic_xmit_frame() cannot
> overflow.
>
> Would alloc_etherdev_mqs() with MPNIC_MAX_TXQS and MPNIC_MAX_RXQS express
> the intent more precisely?
>

Like you said the real rx queues half is set in the commit that
allocates rx queues. Don't think this needs to change here.

1024 is the right count to use for both tx and rx. The Tx triads have a
second submission queue for future use with xdp, but that should not be
registered as a real tx queue.

> [ ... ]
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/=
ethernet/meta/mpnic/mpnic_txrx.c
>> index aaa3a3e99a138..b1fb0d3902a7a 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
>
> [ ... ]
>
>> +static netdev_tx_t mpnic_xmit_frame_ring(struct sk_buff *skb,
>> +					 struct mpnic_ring *ring)
>> +{
>> +	__le64 *meta =3D &ring->desc[ring->tail];
>> +	u32 tail =3D ring->tail;
>> +
>> +	if (skb_put_padto(skb, MPNIC_MIN_FRAME_LEN))
>> +		goto err_drop;
>
> [ ... ]
>
>> +	if (mpnic_tx_map(ring, skb, meta))
>> +		goto err_free;
>> +
>> +	return NETDEV_TX_OK;
>> +
>> +err_free:
>> +	dev_kfree_skb_any(skb);
>> +	ring->tx_buf[tail] =3D NULL;
>> +	ring->tail =3D tail;
>> +err_drop:
>> +	mpnic_tx_flush_doorbell(ring);
>> +
>> +	return NETDEV_TX_OK;
>> +}
>
> [Severity: Medium]
> Should these drop paths count the dropped skb somewhere?
>
> - A skb_put_padto() failure goes to err_drop with no log and no counter.
> - An mpnic_tx_map() failure (oversized head or frag, or
>   dma_mapping_error()) only logs a rate-limited netdev_err() before
>   dev_kfree_skb_any().
>
> Neither path calls dev_core_stats_tx_dropped_inc() or updates any counter=
.
>
> More broadly, mpnic_netdev_ops only provides ndo_open, ndo_stop,
> ndo_validate_addr and ndo_start_xmit:
>
> - There is no ndo_get_stats64.
> - pcpu_stat_type is not set.
> - dev->stats is never updated.
>
> The per-packet totals in mpnic_clean_twq0() only go to
> netif_txq_completed_wake() for BQL.
>
> Won't dev_get_stats() report zero for tx_packets, tx_bytes and tx_dropped
> while traffic is flowing? The last patch in the series, "eth: mpnic: add
> basic Rx handling", still doesn't add a stats callback.

Stats coming in subsequent series.
