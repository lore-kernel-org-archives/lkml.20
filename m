Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792452207;
	b=eYnKc4nd7C28uqjggWsaems9ukJsKJtkipXxDAlVtEplfgaZJh+fsAJS+UZuVWo4UBq3
	 OS/5qbOqZWyAAcLE9/x2fv32WHA1m9Q6CNK/zfwQi6KSMaFniP28134/Nmdw04CVSnj+l
	 bmNH/95f7ccFFC3HjoLWGUSXoLbB0J06c+fWPrHIS0UolanzZPRL+0AVmhrhAh8sFynlK
	 6wMxjZV8C5GFnhoMHG0qFtFkNz03i9so0TiVR4NM+hyDzO/DaG0WYRbcmUM1MDDv61qYs
	 MFNT4yFaR3MBcQq+HsPLrYCOU1RPc7LzuLqRbPI6VJKYImAawbF2Be4dmARMV4bYPFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3liClcNQdcRAqalV+YXuv84MaDYDw0sfM0/SbIZNVcI=;
	b=l1l8cNx2OSsqm+XnorSa32/ulZDjOh8J90qHKgzf88bXWiQXN2tVNlKtYoNELs+A0yI1
	 +7ie37mJLV0xLbiQyKRv4eSCwM0E1IDe0pioa5Y4I6nR32TJhWizaz0y+ItXmivWacVTp
	 4H6OWTFm/aSY8s7IYRJT6i0B0vtcV8d5KgYOVUhwf5rjJ1MuEFPpZh+ABVg8mnmLOTSt6
	 UKFOQBfLdCUSAO/BdcT0LqAruqrOAGEkLEeOiuwBsUvai8ZMyyMQo/2sIosF5iQlVM9LY
	 TC390kqht0GCg150T536WOgwGZn1o1h3kcuXn4EEdqOTHhB95RjiO6vvhRVQj7LSEHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KqM6SFn9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A839606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A839606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KqM6SFn9
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c43373ae89aso273729066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792452205; cv=none;
        d=google.com; s=arc-20260327;
        b=jxaKv02TTNDQ0iBaRqtfncErqt2EvTg6rGSf3PfgQc1KYNEh/tUeq5VoZk1iZOsVi3
         2KeiJ8IqCfO619ZdbaSB5nowIj/2V1IYBPfh+85xO2m/OhSTU8bsG5OmbzbDVLIwEEI/
         c2EGmgTpwwTj4K483VT0l2PHVIHznRk2svKJizqqiSYbj+cUm30IZ0TNpFkk5PgenR3c
         dplKie5T+i0I0gbk5sL9PU9+M0V0vCIwQUT00lqJ1HstKephW6C7s+yXtQXiK+lTco/b
         4GOh7yLpmCZ/oEc6fTk3Fv6eJrM/EpRAlYzfin3zheeMSvmgVkNMPYvoa+t7WxN6tAI3
         fBjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3liClcNQdcRAqalV+YXuv84MaDYDw0sfM0/SbIZNVcI=;
        fh=vbBPTgIxV4wnOng5tAEs/UD0RrkvqkKFDB5G/1PQitQ=;
        b=naL8IJgs7NspchhrpxCoLQbmuq4pz+ejmf6qh/9fvmetmHbHS/TSqIgb/bbokgyVm9
         NbYQitFsx2W87IG53HhOP6RzQ9JlX2os4G9iB7GHO/CNLLSZYyn4+UuIGYxkqqeUIVXf
         0LkKDSis0/XQCiZ21743K6/4LNxvMdZhcX64mg61Jx60BarbQBTVL3tVvziVdL+DnlMM
         eS3YAvQyvbN+Sy0KP5ceN2VtMhAJPm8pax9vuOZgZdUw4JLX/n4Q78qmq0BwPALlvaCQ
         wlWl+UlVUQ2t6K2DLNswEIyLllanlVV0ypLXgPwf/8T7lB6/aWkL3BO0wtlbzUNRASRV
         8T9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452205; x=1793057005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3liClcNQdcRAqalV+YXuv84MaDYDw0sfM0/SbIZNVcI=;
        b=KqM6SFn9jVt07EtldgCpMwXpUpYVJ14RI+Z8AhyEgCOTLRJBOy/HUq4YUCuEDtmvsw
         5AO1NC4X+ZicKCiH7S3r7MYceNc+0AEL3CBmcCUdhOEWF5mByX3bcP8wjk6GXSj3KGXw
         5kJS/dcPNlyZKjFTdKOwjnIl7SdMIY4pC/rfWF0ZpDwRKaCj9Z0dQZ+IOfgtC5KyD7KU
         cxQPcHl+foarXWukMGJ0dNRExoxtVIvHYiU/UlsgM4xfxeLTq/Znli9/PYp7sHzOFMRd
         lPnU9hkdT12wLffkbzZdhAKYbJ1t2r9XPNoF7XROcp4ryeq/F+Q2w1i06auYwIDPUQ2w
         +cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452205; x=1793057005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3liClcNQdcRAqalV+YXuv84MaDYDw0sfM0/SbIZNVcI=;
        b=Oy5xpE5Yb4OKqszUe+TLW7+ACcSiDqQnvXEKW+ALmgS3mkt41h1bmLFVhRAbHNI5vW
         WqelT7uxKEgBdG7dR0iot3Iw0ohRae8Ea9AuWKmiEjJXkfBEIkkibp/p1KVp2+mQa/qB
         7y0qCaeUQb5YvV3sEkgt0Ozi6mmIN2mg7GaTUqoZ2YU66cfNFfcZNaylMs316L+hMS7P
         tegIi1ue18dGDe/mrAAKL2EyqinreQ4ADYVFNky62Lcq/ZAR8jljXN+4DedRv1e2SGpe
         5nLIXZ3rRFy8etRb/z5xh6qaanoSDAjZ81UsIjoT8eYqKeSwe40VOzwsRVeaxEIguOaE
         Gp+g==
X-Forwarded-Encrypted: i=1; AKwUvBxwpNpKY7UXpPW/1CxLR146N2tRkYfh4xWlEleiM2DnprF5kmeKlxTmddvxI1z27RmV8Y54qpoe21lW1O8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLagqNTaLy3En9jU19wXJn7H5tuZjLKdSyLlPK4uPwdtu/oEixI
	EUXuiRdT8Fxu/YubJj82G8S99F4iAnAO5fCW/e/mDrd0cGUagtCXuaT7DydZjK0Icv4eY+rtSVk
	LBXSrwmMAS3nyZyErmu0TVVaNvF2YtA==
X-Gm-Gg: AYBFou2k8u7fFR7NiW5AjoyJtsY0EyBT2r2UFkack6NZoKOYX2AJSd9qFzlrvbqSKoX
	6i4oBl057l0x0uEXfrv//2b7JW8qy9KJe6zgvhIqADHZyhi91Zp5jGpijNUnsX3WRxKmvOQQurq
	SVqc1uZHDHp0vRO+gK9TD5G2dAcuWBUdxSiTBfoLjil0P3J2xgu/+ncfkvSEvPVAnvJtSf+XNBj
	cJ6+tT5wh17ufpmQZKc8uqWpxnplwMAzP7SK9LqLhHqTylYmHQvjK7BBG0Twumh9cpIcAEM4vDX
	RN5qPFRjJI5ksMtKswO+bcbUgSv7gqwB8duXUemrkcXxAWTPx2hxGtgKM5UFpouGXyhOi3+VON1
	ikcmUGJAZdjnmN/W3aHgEAjwm6zQt9Tz1Jp0X+js3TtkEvYDlLesBx1zaPXrfkno1G4pO
X-Received: by 2002:a17:907:9614:b0:c2e:8eb7:53e8 with SMTP id
 a640c23a62f3a-c419ed3674emr829871166b.30.1792452205119; Mon, 19 Oct 2026
 16:23:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016020035.3621768-1-mhun512@gmail.com> <e17bcdcf-3ae6-4444-ae18-aed0f98d5a6b@huawei.com>
In-Reply-To: <e17bcdcf-3ae6-4444-ae18-aed0f98d5a6b@huawei.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:23:13 -0400
X-Gm-Features: AclHuK_vsw1ZU2Q3bVlL6cGmC1_FQPWEDHodzuisv_SXyRG2bdJWcoh1e31ahh8
Message-ID: <CAGEsz8F6Xiwx5RQ88spip4a6Xmcmb1A3yp7WDLw9_LfJT1-eXg@mail.gmail.com>
Subject: Re: [PATCH net] net: hns: retire service work before releasing device resources
To: Jijie Shao <shaojijie@huawei.com>
Cc: Jian Shen <shenjian15@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jijie,

Thanks for the review. In v2, I will keep the dump outside RTNL and
remove the extra link-update locking. The original RTNL scope around
reinit will remain to serialize with ndo_stop(), with a state recheck
after acquiring the lock. I will clarify that draining work before
unregister makes additional serialization against unregister
unnecessary.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 3:00, =
Jijie Shao <shaojijie@huawei.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>
> on 2026/10/16 10:00, Myeonghun Pak wrote:
> > The remove path releases ring, PHY and accelerator resources before
> > canceling service work, allowing use-after-free. A pending worker can
> > also reinitialize the device or publish linkwatch events after
> > unregister.
> >
> > Set REMOVING, synchronize an in-flight TX timeout, then shut down the
> > service timer and drain work before unregister invokes ndo_stop.
> > Serialize reset and link-update state checks and operations with
> > unregister under RTNL.
> >
> > Compile-tested with Clang 22.1.2 (W=3D1); not tested on hardware.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: b5996f11ea54 ("net: add Hisilicon Network Subsystem basic ethern=
et support")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >   drivers/net/ethernet/hisilicon/hns/hns_enet.c | 37 ++++++++++++++----=
-
> >   1 file changed, 27 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/hisilicon/hns/hns_enet.c b/drivers/ne=
t/ethernet/hisilicon/hns/hns_enet.c
> > index e905f10b894e..977f054b00c3 100644
> > --- a/drivers/net/ethernet/hisilicon/hns/hns_enet.c
> > +++ b/drivers/net/ethernet/hisilicon/hns/hns_enet.c
> > @@ -2024,21 +2024,22 @@ static void hns_nic_reset_subtask(struct hns_ni=
c_priv *priv)
> >               return;
> >       clear_bit(NIC_STATE2_RESET_REQUESTED, &priv->state);
> >
> > -     /* If we're already down, removing or resetting, just bail */
> > +     rtnl_lock();
> > +     /* Serialize the reset decision with ndo_stop and unregister. */
> >       if (test_bit(NIC_STATE_DOWN, &priv->state) ||
> >           test_bit(NIC_STATE_REMOVING, &priv->state) ||
> >           test_bit(NIC_STATE_RESETTING, &priv->state))
> > -             return;
> > +             goto out;
> >
> >       hns_nic_dump(priv);
>
> Since hns_nic_dump() can be highly time-consuming, is it really appropria=
te
> to execute it inside the rtnl_lock critical section? Holding the global
> RTNL lock for a long period might block the entire network control path
> and impact system responsiveness.
>
>
> >       netdev_info(priv->netdev, "try to reset %s port!\n",
> >                   (type =3D=3D HNAE_PORT_DEBUG ? "debug" : "service"));
> >
> > -     rtnl_lock();
> >       /* put off any impending NetWatchDogTimeout */
> >       netif_trans_update(priv->netdev);
> >       hns_nic_net_reinit(priv->netdev);
> >
> > +out:
> >       rtnl_unlock();
> >   }
> >
> > @@ -2058,7 +2059,14 @@ static void hns_nic_service_task(struct work_str=
uct *work)
> >       struct hnae_handle *h =3D priv->ae_handle;
> >
> >       hns_nic_reset_subtask(priv);
> > -     hns_nic_update_link_status(priv->netdev);
> > +
> > +     rtnl_lock();
> > +     /* Keep linkwatch events within the netdev's registered lifetime.=
 */
> > +     if (!test_bit(NIC_STATE_DOWN, &priv->state) &&
> > +         !test_bit(NIC_STATE_REMOVING, &priv->state))
> > +             hns_nic_update_link_status(priv->netdev);
> > +     rtnl_unlock();
> > +
> >       h->dev->ops->update_led_status(h);
> >       hns_nic_update_stats(priv->netdev);
> >
> > @@ -2398,6 +2406,21 @@ static void hns_nic_dev_remove(struct platform_d=
evice *pdev)
> >       struct net_device *ndev =3D platform_get_drvdata(pdev);
> >       struct hns_nic_priv *priv =3D netdev_priv(ndev);
> >
> > +     set_bit(NIC_STATE_REMOVING, &priv->state);
> > +     if (priv->notifier_block.notifier_call)
> > +             hnae_unregister_notifier(&priv->notifier_block);
> > +     priv->notifier_block.notifier_call =3D NULL;
> > +
> > +     /* Join a TX timeout that passed the REMOVING check before work d=
rain. */
> > +     if (ndev->reg_state !=3D NETREG_UNINITIALIZED) {
> > +             netif_tx_lock_bh(ndev);
> > +             netif_tx_unlock_bh(ndev);
> > +     }
> > +
> > +     /* Stop the timer and drain work before ndo_stop touches the hard=
ware. */
> > +     timer_shutdown_sync(&priv->service_timer);
> > +     cancel_work_sync(&priv->service_task);
>
> The commit message states "Serialize ... with unregister under RTNL",
> but cancel_work_sync() has now been moved before unregister_netdev(),
> which already drains the service_task.
> Is the RTNL serialization in hns_nic_reset_subtask() still necessary?
>
> > +
> >       if (ndev->reg_state !=3D NETREG_UNINITIALIZED)
> >               unregister_netdev(ndev);
> >
> > @@ -2411,12 +2434,6 @@ static void hns_nic_dev_remove(struct platform_d=
evice *pdev)
> >       if (!IS_ERR_OR_NULL(priv->ae_handle))
> >               hnae_put_handle(priv->ae_handle);
> >       priv->ae_handle =3D NULL;
> > -     if (priv->notifier_block.notifier_call)
> > -             hnae_unregister_notifier(&priv->notifier_block);
> > -     priv->notifier_block.notifier_call =3D NULL;
> > -
> > -     set_bit(NIC_STATE_REMOVING, &priv->state);
> > -     (void)cancel_work_sync(&priv->service_task);
> >
> >       /* safe for ACPI FW */
> >       of_node_put(to_of_node(priv->fwnode));
