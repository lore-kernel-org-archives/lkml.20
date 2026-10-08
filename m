Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1E133122A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 04:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791432929; cv=pass; b=e5PXsAuANs8UIXHhf0AvOphEivvL5wIq88Jr8wufgU1KOrZaBI+AFGQFN8cl2Gdk9iZ/qkuwg5aOymgO6VrQtkiC4fj/ZgSycIgsOuoJCE4r466e0Fcc2XAQPZaeqq5KvUF3IDZGJbEQUQ0kXteI2//wZe2pz0D+4XThqvvM6KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791432929; c=relaxed/simple;
	bh=HiSvYPDXqPvWEVmnS61tLSv9MuxSkdO1CETIYvM23ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwWxRoSSRFZ5HvAhWJYMcvkgZKg8kN3KjmkGgX6Zv02fFjfKiHKVXTqGVvCuvXCOoXgon/hrYT4q8j1azMFtgzIY6PmlgIWE1EkRtN/zXOf1t3MMTwHsuqzUnjrEBtx86VGvC0phz61LYE01ObgV+hDW7SdyGuzrzZpEbzDwhIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzR0k70e; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzR0k70e"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6768ced47aeso3034233d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 21:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791432927; cv=none;
        d=google.com; s=arc-20260327;
        b=Ms3P/pYz+X5ub6rke6y2zZwtoIFw61R4J/soSL5C9sy6JZNifG/RVCuiUfhkgNqCpr
         6iQXk/W60VlhsAA8OFUFPf8jPQ3HdrqdU59Xjzdp7gngAfehSy50lPSCK1eoo8zeLHMZ
         vmeyMhVL8T6ikM8XK4mvrRgMKKaqKbFp+nshGf375ve/UirX2WL4pMk2l8ssnDuf9rfe
         RmiwTVg6EnGgiqfZqeUfEbZVg2owtIAr2yyaAmR0uzGdOBZaid0JiiBIyV/g5WYEQ9Qc
         BbE0PZiBo0SxdiS9Jk7A83FCPQBDrORObfZgvXZ8IgFBaBW2ororVLbFndwOeoHk6t85
         Hitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ni3U1mE/yYvE5MNAfH3rxBCgOfVpQVRjU3mksJnmC0Q=;
        fh=KFmqzJOaDajAYbwIvD58lYftWnL6ixUDt08X+wTqilo=;
        b=HjIxdDNc4+SSI7A32KWi8ue/5dh3YD72DryYWV6nIsYEJq0H6gUHa5eO13ArII0XUC
         PPBAMjMn0pirDLbaK8dmv5Cx8HXL8Mtmm/NIRPOjj+8xNQBCR00QqjNVVLUwnlI1Hd1A
         LVK9Ew3o747DOPNYMumDMqk5wHNLyEwoUhzVN7b7X5m+hBEy8iQAsQQEOKFyCrBv8bka
         zpAiuol2y4xNJEpqLNiGlFiPMSSv31NvaFfTS4g+bcYzz86M9iJwjKWukLXeBBlGoLT5
         6ZNReYljbw2cScHSo9itD5MSlaGEid9HdNXWL6RXcICriPxyP3IX5wmWaJFjmLqzBQ3R
         tEsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791432927; x=1792037727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ni3U1mE/yYvE5MNAfH3rxBCgOfVpQVRjU3mksJnmC0Q=;
        b=XzR0k70eQjj4agYQmcNl4HL9wL5ZWeGl2UYFRzUp51whL7ztKybgyI4K8VMVjSFsFP
         oSkFbWxHGg2n5iIWtuEzGlePKHWWMRGqlrS1/Tti5j0r7ISETvCDXwp7hILJSb8NHt8g
         IxFyMePLeJ6JosoCohOcAlWMQYPrA9JddH6uujP20Ed1A33PXH0qQewrphqYLcQRqGa3
         XROVhYxpF0DukugMczQlEVu8kyB1wXTXAJZgKP2Sc10gUwEWAimHF6XsipXQAxQED0rK
         lFKwGUVYeSMJ4tY472Pc+AOoNa8oERWtfdygnUJ0mrr9J0CqbxaUviFIj86UvhSpDCzr
         UeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791432927; x=1792037727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ni3U1mE/yYvE5MNAfH3rxBCgOfVpQVRjU3mksJnmC0Q=;
        b=PJkjAW/JBfPnyA9ns1yvCJPfSJLeQfTehoePlOBDOcj04ntD0ftsEcnB4y9pFbSulY
         6Yj+hTSRlRrtKtM1q3Kl71KfnanxDusku4TtW+V/wP4/wr3UZigRx+w9Vw5QytrL0NPb
         sgdaXc8Sbx71qc0W8fR5cQQRSy8Kw7iwKXD2ShiaiCs8FVm2kuPQq77F2Z/Aq2KnM4Gs
         B0x3qIolaEj5EM0k6M+sBRihSRHzc67Kt6VPgl9HKMtaSt0MxeIcOQ/X2dGugK1pgHKi
         tjIvHMYwx08mxwcoexQC7XAOu1/78VtJjuUi9BhcNN0aNhSqI2RRpBV6GjaGwe96okjC
         LZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBz5pPNFv3cDYL2d3/t6kdgzTx+e/+/uyyPfLfE5L1dPr3zyFpwQgv07lyfOsL3teiJXImDGUwU2hotIurA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYGz4vvh+c8Cs+/mTmR2tfUSH9RO8Y13RtMojZ/LA0ISiFXsGd
	fvM87FmapgXX70HUyadneertlto4/UdirTOp9M2X7+U3mYaNVwVCIgT+oLFEdgVOdzqiaH/p6Sw
	9REAnVnkMRiERbBSKzig54+aSXriS8ZY=
X-Gm-Gg: AYBFou0R0WKofdDHAPTM6Pc45ruzROD5+Ic24BVMxo2j0woV+Ud4Kgd+5vy9NDa2m8w
	NEvrXWFIheSXccxxA+qQ83+oUDY7/c90S+kjLJ0Peon37Bp9JWC8gfl107UZZHUNj+T5XUPv9G5
	V55LrGtbdhKF/9LD2eloWj/bQoDStcrhiGPzFpNF09lLLzFYFoQFtThd9JzpiSlQ0+y+9yjscsQ
	dcEwIw0x20HlUsrbWG7N8V+e1ougUgE44gDygVoMoeb+HbRjlLmcnpKGIiqBxGdSSAJhseWaJ0B
	fL6Ylz9qebhE0ZirtTnWg2LYEk09Um7CR1CkveZibbgJ5oFOQvzctVE=
X-Received: by 2002:a05:690e:458a:10b0:675:6acc:d1a1 with SMTP id
 956f58d0204a3-67909dd9839mr1860290d50.11.1791432927404; Wed, 07 Oct 2026
 21:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007113611.2082-1-yogeshgaur.83@gmail.com> <20261007-rustling-congenial-kraken-8bbdb1-mkl@pengutronix.de>
In-Reply-To: <20261007-rustling-congenial-kraken-8bbdb1-mkl@pengutronix.de>
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
Date: Thu, 8 Oct 2026 09:45:15 +0530
X-Gm-Features: AclHuK9d6F0XiDHJJKsZ7ABW-KDT80rpT2TLY7hlHxLRiJCumRYu4nJy0hZ9rKo
Message-ID: <CAG6enPzfok4+zN-BxQkmw68DPJ_vEemDiDwsAGXQuLPPSTq07A@mail.gmail.com>
Subject: Re: [PATCH] can: vcan: use per-CPU device stats
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+937a3a1fbfbc99d6fcaf@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 6:50=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.d=
e> wrote:
>
> On 07.10.2026 17:06:11, Yogesh Gaur wrote:
> > vcan_tx() and vcan_rx() update dev->stats with plain increments and
> > rely on the tx queue lock to serialise them.  That only holds for a
> > single tx queue.  vcan does not implement get_num_tx_queues(), so
> > rtnl_create_link() honours IFLA_NUM_TX_QUEUES and a vcan device can be
> > created with several queues, each with its own xmit lock.  Two CPUs
> > transmitting on different queues then update the same counters
> > concurrently and lose increments:
> >
> >   BUG: KCSAN: data-race in vcan_tx / vcan_tx
> >   read-write to 0xffff88811aad8228 of 8 bytes by interrupt on cpu 1:
> >    vcan_tx+0x325/0x5d0 drivers/net/can/vcan.c:110
> >    dev_hard_start_xmit+0x10c/0x380 net/core/dev.c:3969
> >    __dev_queue_xmit+0xbfd/0x1ec0 net/core/dev.c:4958
> >    can_send+0x584/0x720 net/can/af_can.c:279
> >    bcm_can_tx+0x3ba/0x5b0 net/can/bcm.c:367
> >   read-write to 0xffff88811aad8228 of 8 bytes by interrupt on cpu 0:
> >    vcan_tx+0x325/0x5d0 drivers/net/can/vcan.c:110
> >   value changed: 0x00000000000025ef -> 0x00000000000025f0
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
>
> So far all drivers use the classic stats, and the CAN dev helper code
> (in drivers/net/can/dev) also modifies these fields. A quick search
> shows these places:
>
> drivers/net/can/dev/rx-offload.c:48:     struct net_device_stats *stats =
=3D &dev->stats;
> drivers/net/can/dev/rx-offload.c:162:            offload->dev->stats.rx_d=
ropped++;
> drivers/net/can/dev/rx-offload.c:163:            offload->dev->stats.rx_f=
ifo_errors++;
> drivers/net/can/dev/rx-offload.c:249:    struct net_device_stats *stats =
=3D &dev->stats;
> drivers/net/can/dev/rx-offload.c:289:    struct net_device_stats *stats =
=3D &dev->stats;
> drivers/net/can/dev/skb.c:29:    struct net_device_stats *stats =3D &dev-=
>stats;
> drivers/net/can/dev/skb.c:402:   dev->stats.tx_dropped++;
>
> Can you modify the code to update the dstats if they are active?

Yes and as per Oliver's suggestion send race fix along with dstats
work on top for can-next.

Yogesh
>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
