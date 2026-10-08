Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340D93ACEF1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432817; cv=pass; b=CqKg1Lhf1gSL5hsHtD7CGGFYRTLft6iG7OUMS4WRgRAZfr6yjdwuj5W0pp0rixYdDQfyAlceD57f4gZOxcjr/kEFSA8vvCXoQfoBnMvDztZhkC8Wh0VjuQQ2cfgDCSA7GBPsqtXAlqs0wzq6yyKPYkiayJeuE5bqyWVt6EOsp/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432817; c=relaxed/simple;
	bh=DexJ4Rup4u7rPB/vqPYNWWgAaahcV3WsYcGnI3nWwLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R60EXv2NPwPlNkJ8KY1MnmCJWbuESbF/3U9tcm4zZQS82j/R5Pp+bKGUvS7MxPRVjlltSmdoi+9214so9JIGOH7kJ+WFrSYdAp3i6TT+GruaZCTNMiDvvwa0C+UP5qUrHT2W7NCcF8S68OALdw2yx9R84xjwN4CfBaMtFIWiiCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pznZAJmq; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pznZAJmq"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6767d92cde6so2383926d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432815; cv=none;
        d=google.com; s=arc-20260327;
        b=PVw3mMDk7msFERftZcghYtfsVN0oNAzzLK6iReP6VfNR6vkfd23R3bE5Rju+DBktF/
         CMMD2zbB67Eq9SOU3TGiJIHCYIYGljYYnfopaDdFrzO5gTuAHXLyPbMYFzC4lJoUD0oS
         F/eUKpUteW21q9+FK2K8VYyZLRZwTIjrIPUU6YKd0AOu2sA5gxNgmb7AVLf2Q8JNvbn/
         Mtd5FU1FtGLXPeAmmD6E9nKejq9Liw1PYhDjP7fcaeLSkbZE1BTLvfX84HDPyHzgX5lG
         pzp8SKfxpUBj/7yKgw58DPUrQ0bE1wUvboTVoPSAFdAHntACVDJx+H4stVFgeJsOgGnW
         TuGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oAieYICSucnxuVyVKR7DS9nN9JBaDIJD2J2XPFRyV5o=;
        fh=AI2PgAJOdKyXxWKas8VIWWpdHnMOweVYQX3T6gQMm+c=;
        b=YXXnlV8v6+sSdJ5sq+fIWx3XwNZlS4buySWEKM5cLprUUVx8MVHF2sgUA+lRS5oIcu
         7BnVoqJOzKyPE+deo/9HKCx65jdnc6IoopQkrisF0ycYscY/rgjptYXDGrllU1o6OaNg
         xUoVuaWiOPGP8VHQP8LGu3TDJvGbdrSqUgNXgXzoV0XL7y90gseLQKJqqaL8choP3s+h
         MiuqxVelbQZ/IepPCXfTuHe/HVK/jGYkizEdkTSgCY3tW9uVO/X7Ypagz16to4AsNmJu
         0uf3Mp5U6JTCxDXwQSwP0DO9NeQunPc7o4Qfyivqg4wWMByPOjIX70z/Uv3GIBp8618z
         5aNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791432815; x=1792037615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oAieYICSucnxuVyVKR7DS9nN9JBaDIJD2J2XPFRyV5o=;
        b=pznZAJmqO74UjQ8SYOzLCXA2IouYzeTDqGvoHjClazdL7cGQ0Ru0DK6v13m2ikD9Iq
         0oB2KKxQ/mkcsqKUhRNFFi/Fosyjj9b+Tdt6tKeYqTmJ2neHnNykmMDnH2SuUfalU6VN
         MRoyO26nT/P30cNa+Rk4z1iFsiQP0o01NCQ276LHzXmVq2m/zllc4lNbXXeVB9nNlpeR
         ncQtNUQXmzZ4s9gX2AKmEcfRvhcNbvcxkLbBL/taErwzHgEuLTZkoFRPz9iTEyZe5EgE
         x5BYZuTrGdCPQgMJ4NcQX1DYrbqTmQWHLh2FQjsZWPK3hW3pm+vOkcAoZeaTHxur0iwp
         WbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432815; x=1792037615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAieYICSucnxuVyVKR7DS9nN9JBaDIJD2J2XPFRyV5o=;
        b=Muhi7TVzs5C3DGbF+62N8T2qmXhd1LQcbEM6D67ANW5h22xbyg9Kvl09T4b85jjmYV
         zfORNeIRUhcy3SwY0JXMsC48AoB+OP4oUddxU6q4PXCSIx0KAnI/XNrF9fDaQw5Tz9Xw
         sxVd8/VrWxKgfjiYWa/5ByIpKxBxTg9rhtJAWjhbHhE9DypSgerOC81elokn3/Ge57bH
         sW6YVmlHITCh09JEZI0Ix6/AWBHGRbLYXTZpLeKOuHaiDN+vnbcnNFFNXMLFtbEtmInT
         TkmBnNHuVoPtN/cnb/C63AOojfsqEFCu1LJREqicJHVd/Qev7kOcsEjYOR74srPGuS/Z
         GS6A==
X-Forwarded-Encrypted: i=1; AKwUvBzvAn7ehFfjhTSYtDFHUAT+jGb36v2dC9FhpyezFw1Hxu6YwoTD1e3RssVuLiLbcmjS6Zds6ehdcBCuTzM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpLN7+avaEWh1UQ0wMdysEkLgzbCj+ffKdWah5dXRfA2+Mcu+z
	X7jxD3uW4s+O6fUezWFUPNb8YyTofTaXZ89S1vtSzGbUUf7Gi4faMBJIdhRj/1hoFOJ0otL/QZ5
	0wFRfW/XFW8DI1IML/IZLItAJSKdj7wY=
X-Gm-Gg: AYBFou2qRnbKLSnZgQVMb/3awdXhxM7TJ0EC7c/VVFwmPx6ZJBvaE1dVEeMmr8dNu3x
	9TV88w6P2YbWY6eMfEGZASTk43o2eW6AiFlQk9rD63UtVH79bPbsl5wF33NkZYkbG60Lass5+oa
	wzyso0Jpd91/qN4vHrugxr0jma3pAaz36VbC/zjBN+y8AlJgkWr88u5C/IWMON+SFUI4otimeMG
	GWXs6H8BYFW3OsQQ2lJKS9pKeH9f2T5LokbaB5kii0ZokxA4tmpA0I9wUS1FtLKWvGrcEn6JiPH
	ES4DY7EB1mwMkTlREFKaYucS7I3xyrstt/4dxZvAK41rJ3pdu7qiUkM=
X-Received: by 2002:a05:690e:134a:b0:676:87c6:4f57 with SMTP id
 956f58d0204a3-6790a36edb8mr2509435d50.73.1791432815092; Wed, 07 Oct 2026
 21:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007113611.2082-1-yogeshgaur.83@gmail.com> <f06b2a33-570e-4976-b4ac-b26b74f27cc6@hartkopp.net>
In-Reply-To: <f06b2a33-570e-4976-b4ac-b26b74f27cc6@hartkopp.net>
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Thu, 8 Oct 2026 09:43:23 +0530
X-Gm-Features: AclHuK9oczXosRk4l605xlZnewa1TAyTXVkGwfBtQQZt2LbHhAG2hgUtTmgK5VY
Message-ID: <CAG6enPzuqq3sLNR5bUNn-z1Y49ut8oZW-6=O2TuxC_EK4RJDzA@mail.gmail.com>
Subject: Re: [PATCH] can: vcan: use per-CPU device stats
To: socketcan@hartkopp.net
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+937a3a1fbfbc99d6fcaf@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 10:41=E2=80=AFPM Oliver Hartkopp <socketcan@hartkopp=
.net> wrote:
>
>
>
> On 07.10.26 13:36, Yogesh Gaur wrote:
> > vcan_tx() and vcan_rx() update dev->stats with plain increments and
> > rely on the tx queue lock to serialise them.  That only holds for a
> > single tx queue.  vcan does not implement get_num_tx_queues(), so
> > rtnl_create_link() honours IFLA_NUM_TX_QUEUES and a vcan device can be
> > created with several queues
>
> dev_dstats_tx_add() has been introduced in Linux 6.14 so it is probably
> some can-next material for Linux 7.4+.

Agreed.

>
> Btw. why don't we implement get_num_tx_queues() and return 1 as a
> potential stable fix? This would add a correct locking via the existing
> tx queue lock for all vcan statistics right?

The locking argument holds: vcan is not LLTX, and every counter update
(tx, the echo-mode rx in vcan_rx(), and tx_dropped from
can_dropped_invalid_skb()) happens in vcan_tx() under the xmit locak.

But get_num_tx_queues() alone does not stop the multi-queue case, as
rtnl_create_link() only consults it when userspace did not ask.
>
> Best regards,
> Oliver
>
> ps. vxcan should have a similar problem.

Yes - same pattern and the same single-queue argument works there.

Plan for v2: limiting vcan and vxcan to one TX queue, then the dstats
conversion for can-next.

Yogesh
>
> , each with its own xmit lock.  Two CPUs
> > transmitting on different queues then update the same counters
> > concurrently and lose increments:
> >
> >    BUG: KCSAN: data-race in vcan_tx / vcan_tx
> >    read-write to 0xffff88811aad8228 of 8 bytes by interrupt on cpu 1:
> >     vcan_tx+0x325/0x5d0 drivers/net/can/vcan.c:110
> >     dev_hard_start_xmit+0x10c/0x380 net/core/dev.c:3969
> >     __dev_queue_xmit+0xbfd/0x1ec0 net/core/dev.c:4958
> >     can_send+0x584/0x720 net/can/af_can.c:279
> >     bcm_can_tx+0x3ba/0x5b0 net/can/bcm.c:367
> >    read-write to 0xffff88811aad8228 of 8 bytes by interrupt on cpu 0:
> >     vcan_tx+0x325/0x5d0 drivers/net/can/vcan.c:110
> >    value changed: 0x00000000000025ef -> 0x00000000000025f0
> >
> > Switch the packet and byte counters to the core's per-CPU dstats.
> > The core allocates them for NETDEV_PCPU_STAT_DSTATS and folds them
> > together with dev->stats in dev_get_stats(), so tx_dropped from
> > can_dropped_invalid_skb() is still reported.
> >
> > Reported-by: syzbot+937a3a1fbfbc99d6fcaf@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D937a3a1fbfbc99d6fcaf
> > Assisted-by: LLM
> > Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
> > ---
> >   drivers/net/can/vcan.c | 13 ++++---------
> >   1 file changed, 4 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/net/can/vcan.c b/drivers/net/can/vcan.c
> > index 76e6b7b5c6a1..2ff90cb7eee9 100644
> > --- a/drivers/net/can/vcan.c
> > +++ b/drivers/net/can/vcan.c
> > @@ -71,10 +71,7 @@ MODULE_PARM_DESC(echo, "Echo sent frames (for testin=
g). Default: 0 (Off)");
> >
> >   static void vcan_rx(struct sk_buff *skb, struct net_device *dev)
> >   {
> > -     struct net_device_stats *stats =3D &dev->stats;
> > -
> > -     stats->rx_packets++;
> > -     stats->rx_bytes +=3D can_skb_get_data_len(skb);
> > +     dev_dstats_rx_add(dev, can_skb_get_data_len(skb));
> >
> >       skb->pkt_type  =3D PACKET_BROADCAST;
> >       skb->dev       =3D dev;
> > @@ -85,7 +82,6 @@ static void vcan_rx(struct sk_buff *skb, struct net_d=
evice *dev)
> >
> >   static netdev_tx_t vcan_tx(struct sk_buff *skb, struct net_device *de=
v)
> >   {
> > -     struct net_device_stats *stats =3D &dev->stats;
> >       unsigned int len;
> >       int loop;
> >
> > @@ -93,8 +89,7 @@ static netdev_tx_t vcan_tx(struct sk_buff *skb, struc=
t net_device *dev)
> >               return NETDEV_TX_OK;
> >
> >       len =3D can_skb_get_data_len(skb);
> > -     stats->tx_packets++;
> > -     stats->tx_bytes +=3D len;
> > +     dev_dstats_tx_add(dev, len);
> >
> >       /* set flag whether this packet has to be looped back */
> >       loop =3D skb->pkt_type =3D=3D PACKET_LOOPBACK;
> > @@ -107,8 +102,7 @@ static netdev_tx_t vcan_tx(struct sk_buff *skb, str=
uct net_device *dev)
> >                       /* only count the packets here, because the
> >                        * CAN core already did the echo for us
> >                        */
> > -                     stats->rx_packets++;
> > -                     stats->rx_bytes +=3D len;
> > +                     dev_dstats_rx_add(dev, len);
> >               }
> >               consume_skb(skb);
> >               return NETDEV_TX_OK;
> > @@ -185,6 +179,7 @@ static void vcan_setup(struct net_device *dev)
> >       dev->netdev_ops         =3D &vcan_netdev_ops;
> >       dev->ethtool_ops        =3D &vcan_ethtool_ops;
> >       dev->needs_free_netdev  =3D true;
> > +     dev->pcpu_stat_type     =3D NETDEV_PCPU_STAT_DSTATS;
> >   }
> >
> >   static struct rtnl_link_ops vcan_link_ops __read_mostly =3D {
>
