Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED7A252917
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257776; cv=pass; b=GRE/52m2nmXNg+XSCE342UmBsdjlB6GoMe5Xruey/DZn6FcYAbmO9ojzSI7aRvCNTKLWVPvQwuDNDtAT5RzxkZW92am6+JfEbOmhWSc9DtzeHwEpWJdFdJf+9EIFQIxrQyBDXoy4NBi2PvAH8TaFWhYAfZ4p9wGlSlpMYF1CfFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257776; c=relaxed/simple;
	bh=gWB06G6E/OA5NVJBWpGJh+LAXYyXqipKLeFn7ANva1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwX24boVTsJ4uK0JFIgznRjP4sO0ZDHB7Jau5uTDWfObrEHgNZSY0PHkYmqqsf6G8KAMUOOvFixSTKQEQek8E1bF8+W93MqFVtkq6oMOOWURfw/c8t2YvERiya9UR+40tlzAc/XEmPh0C7A9UlllwhSKa/dXg3hzM/3dzVsTQQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAHsMjbK; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAHsMjbK"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so756241e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257772; cv=none;
        d=google.com; s=arc-20260327;
        b=kSYfoqoWyd2HkZwPbzlhjPSORZXJwrAAjy8MlIu0BmYkWbk3KSqcj2Nn6YkX012a8E
         TfvafMeXZLWzWnfrxXdaL2J5bZNOQDrKe8yBwETSUcOUTeiIAjykQytFA6sdYkONCsYy
         Cf2yAMSN1U67wT9Yo1pWW9SAB2DFDkdROVz2PPXyCJ9nAbFVK9pRVzZIcVT1IvVNkSZX
         8DYt0Aoumzhma13yBf93olJjjL4/eNIe5WBc7NxseQKKp+tCiEuETdMXrrX2lUrfwsmB
         +om6WJiuoPI7mYNcPEHK+1Z3AngeePXpzbnY4veUODmcKEoLgAF/pIb6IUJ4pqdZr0Bi
         iHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gJYVfSEDQsVnkbBJ1tGYnH9ndL0fb4u2tq4xBMYB8CQ=;
        fh=Qsz3eZMpWTQmF9EKwTqucJPwASWqrPMWfxxNZgnW7oU=;
        b=cc6z6WGkXxskRGeBahxuSmlX4it0Y0tSGg7Ax59l6ceQ9UnFxIklU2BpxOGgegzQwQ
         Z7lUsqXx5En4/UkzRbYsHy/yZINH3E0bblvBQNWp2uhI7aWYCUCbzhZC3Q7zyHjnoY1K
         HZIk0tK3+U5f025wpVuVaQW+/oux9rWnG/StZ9gmQRdBzNtjM558vgb7Wo+ipz6nr9WF
         vp3ybdc3uQVKsb+jJ/MpwY/9Bwu5CxiDRUmQRbEmdZmfXfxvoy+cZKTEpxDgJFGraHDF
         qyWcpc0iIS1yKs/oiICwEXKtrlkNCoMR65zUU8hEi2ljs4NCX/6Hpx5Za6PnHNtpccs1
         hilQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257772; x=1790862572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gJYVfSEDQsVnkbBJ1tGYnH9ndL0fb4u2tq4xBMYB8CQ=;
        b=ZAHsMjbKcD+e7+aG9AlfzQOcUSDcK/zdmbe3TTyUUcgI+c7ZaVQibkSyRpfpy80RRM
         hI3uKknB89fVvbrpMHm4eazy4qVqnTorDpIHTFX63dzXO+hyWz/fXaK/01dH3ZpiJqeS
         2HO7E8zBm1n2cmis0RzIeboNYKgHjmRhgJVD9W5wRnTMDK8IJaNZbxu6FmKMFkg+Hxpy
         UswWas+jg8Hn4vko+F8FHrsqf0iKrfPjatchSk7G6wOepCee26YrI1L8gDoD/6crQMyB
         KDKhdvy6UCPqEd7W4Lz7+7SubdwAuLFE9xtlIk9EEZH4ivi15qLLappblOz4ZDzB11/3
         YBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257772; x=1790862572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJYVfSEDQsVnkbBJ1tGYnH9ndL0fb4u2tq4xBMYB8CQ=;
        b=cp8OfcE4N9Rhre5xYVmxDk7GBaaFdVuqz32mOJf0rlvd8qB4p6H2w61zzbZS2taZtF
         D5EM7evbptOnNpdXcUFdnNv49h5G/RDdJXGjbLJsfpYZtndUDUu1QKYdsMDfYz2bB9sz
         xQNJyWjzz/lqmUV33/HPaTgVqsQ6kESQjt1vL1LunU9TsI7BaCqKtYWEwWGpXxbcmQzF
         0GrT4WNNIOT1fnNP0PdcR8QEAFOhcCZjTQEkevUpFZwi3PdasikVGZUgHxERvZOVHikC
         7VA/hOn+akdKl+x3sNBGqhH2XwJT7xrSM1Q6hWb3jZ6gPbHeAFMjEn7i/KPMqe18TV0+
         dcqQ==
X-Forwarded-Encrypted: i=1; AKwUvByci07Uc7h3Zo//o2nskZ7jO68k6H/2B905b/An7wUFfy0lWl7pTxkp61C3uV4dPgT8LKuxPhBjjRkt87M=@vger.kernel.org
X-Gm-Message-State: AFuF++mqcq6obV/RbkBGpyZMqK4Z9KW8kswOoEuQoZHMw7T5McIXSBTI
	yc2Jb800o37U0BbruKl7O7GK59Rpl/EdEWwWI6Z7H8xKJJzaoyvE8iHz6dxUCy0detQkarH5ZBR
	kxLak66o8W2uayXPwDTlP5lyxxEMfde8=
X-Gm-Gg: AYBFou2zzhcnMAqxkuqvDbS8I1aaTep+iv6pODixOz8uvXDiOceJTZ8io0s72rxfGkL
	+A8fV2RVrw+CLNTsOxwbK6N5peSShaL0ivX0yP23Od/anFtoMoP1eykH1XQnopXT/iesMfxZY0t
	Ij70eluHUSBxawJDtYOAAnVJG89oK0Xe9Q7GU77PdcHxPyn0zskNPq9WJY+/al2+Ymt5JkxqaZf
	4/5wBZaXqCELSJofX8cLLatVAGOS4IOzRiAdAljrh4BAqjYDIuKxKyYoezIevCE9GOOvRP4w5lP
	EdWVjal6ugxdQct7lFaU59C0ZC6gB933nYpZIlDea6dZg8D9hQ1o1A==
X-Received: by 2002:a05:6512:150d:10b0:5b8:b419:b89 with SMTP id
 2adb3069b0e04-5b8df0d75e8mr579645e87.16.1790257772059; Thu, 24 Sep 2026
 06:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917121306.23499-1-maimon.sagi@gmail.com> <178999282007.2160803.6952878199943822549@kernel.org>
In-Reply-To: <178999282007.2160803.6952878199943822549@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Thu, 24 Sep 2026 16:49:05 +0300
X-Gm-Features: AclHuK85KsXovvOUr2OPfXpsHg-ZsrDaqPDh7LgpYDySab54LfHYs-T8fpEBRXI
Message-ID: <CAMuE1bE40RYoB0q0Wxq15PPRzGigX=T3EPJV2C5WRwcO7cbPow@mail.gmail.com>
Subject: Re: [PATCH net] net: axienet: restart the TX queue after a DMA error reset
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	michal.simek@amd.com, daniel@iogearbox.net, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 3:13=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 (2) =C2=B7 Medium: 1 =C2=B7 Low: 0 (1)
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The netif_wake_queue() added at the end of
>   axienet_dma_err_handler() is not serialized against=E2=80=A6
> - [High] The unconditional netif_wake_queue() added at the end of
>   axienet_dma_err_handler() can undo the TX stop that axienet_suspend()=
=E2=80=A6
> - [Medium] The added in-code comment in axienet_dma_err_handler() and the
>   commit message assert a TX-watchdog failure that cannot happen in this=
=E2=80=A6
>
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but
>   axienet_dma_err_handler() unmaps, frees and clears every TX descriptor=
=E2=80=A6
> - [High] This problem wasn't introduced by this patch, but
>   axienet_dma_err_handler() performs a full AXI Ethernet core reset=E2=80=
=A6
> - [Low] Concern that the newly added unconditional netif_wake_queue() in
>   axienet_dma_err_handler() re-enables transmission even when the=E2=80=
=A6
>
> --
>
> net: axienet: restart the TX queue after a DMA error reset
>
> The patch adds netif_trans_update() and netif_wake_queue() at the end of
> axienet_dma_err_handler(), so that a queue stopped by axienet_start_xmit(=
)
> is restarted after the DMA error reset has reinitialised the descriptor
> ring.  No Link: tags are present in the commit header.
>
> A few questions below about the new wake and about the surrounding recove=
ry
> sequence.
>
> > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/driver=
s/net/ethernet/xilinx/xilinx_axienet_main.c
> > index 1722b7038f340..814d92fcb4fda 100644
> > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > @@ -2778,6 +2778,15 @@ static void axienet_dma_err_handler(struct work_=
struct *work)
> >       napi_enable(&lp->napi_rx);
> >       napi_enable(&lp->napi_tx);
> >       axienet_setoptions(ndev, lp->options);
> > +
> > +     /* The ring is empty again, so let the stack transmit.  The queue=
 may
> > +      * have been stopped by axienet_start_xmit(); netdev_reset_queue(=
)
> > +      * above clears only __QUEUE_STATE_STACK_XOFF, and nothing at all
> > +      * without CONFIG_BQL.  Refresh the transmit timestamp first, or =
the
> > +      * watchdog fires again on the next tick.
> > +      */
>
> [Severity: Medium]
> Can the watchdog actually fire for this device?  The comment says:

No.  Neither ops table installs .ndo_tx_timeout in the tree this applies
to, so netif_trans_update() has no consumer and the commit message
describes behaviour that cannot happen here.  The TX timeout handler I
had in mind is a separate net-next patch that is not merged.  The rework
drops both the call and the claim.

>
>          * without CONFIG_BQL.  Refresh the transmit timestamp first, or =
the
>          * watchdog fires again on the next tick.
>
> and the commit message states it as a fact:
>
>     The transmit timestamp is not refreshed either, so on a kernel with a
>     TX timeout handler the watchdog condition stays true and the reset ca=
n
>     be retried indefinitely.
>
> Neither axienet_netdev_ops nor axienet_netdev_dmaengine_ops installs
> .ndo_tx_timeout, and the driver never assigns ndev->watchdog_timeo
> (a grep for both symbols in drivers/net/ethernet/xilinx/ matches only
> xilinx_emaclite.c).  The core refuses to arm the timer in that case:
>
> net/sched/sch_generic.c:netdev_watchdog_up() {
>         if (!dev->netdev_ops->ndo_tx_timeout)
>                 return;
>         ...
> }
>
> So dev_watchdog() never runs for axienet and netif_trans_update() is a
> timestamp store with no in-tree consumer.  The note below the --- line
> mentions this depends on a separate TX timeout patch, but that note does
> not reach git history, and the Fixes: tag invites a stable backport of a
> watchdog retry loop no in-tree axienet can produce.  Could the comment an=
d
> the commit message be reworded to say the timestamp refresh is preparatio=
n
> for a TX timeout handler rather than a fix for observed behaviour?
>
> > +     netif_trans_update(ndev);
> > +     netif_wake_queue(ndev);
>
> [Severity: High]
> Can this wake be lost, leaving the queue stopped for good?

Yes.  The handler takes no part in the start_xmit/tx_poll handshake.
The rework quiesces the transmit path with netif_tx_disable() at the top
of the handler and wakes the queue at the end, so no transmit can race
the teardown or stop the queue again in between.  That also covers the
pre-existing teardown race you point out further down.

>
> axienet_dma_err_handler() runs in process context and never calls
> netif_tx_disable() or netif_tx_lock_bh(), and it sleeps for tens of
> milliseconds inside axienet_dma_stop().  An axienet_start_xmit() that
> entered before the teardown can therefore finish after the worker has
> reset the indices:
>
> axienet_dma_err_handler()
>         lp->tx_bd_ci =3D 0;
>         lp->tx_bd_tail =3D 0;
>         ...
>         netif_wake_queue(ndev);
>
> axienet_start_xmit() then runs its own stop protocol:
>
>         if (axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1)) {
>                 netif_stop_queue(ndev);
>
>                 /* Matches barrier in axienet_tx_poll */
>                 smp_mb();
>
> If that netif_stop_queue() lands after the worker's netif_wake_queue(),
> __QUEUE_STATE_DRV_XOFF is set again with nothing left to clear it.  The
> only other wake is inside the 'if (packets)' branch of axienet_tx_poll():
>
>                 if (!axienet_check_tx_bd_space(lp, MAX_SKB_FRAGS + 1))
>                         netif_wake_queue(ndev);
>
> and the commit message already explains axienet_free_tx_chain() cannot
> return a non-zero packet count once the handler has zeroed every status
> word.
>
> The existing queue-state protocol is a two-party smp_mb() handshake
> between axienet_start_xmit() and axienet_tx_poll(); this adds a third
> writer from a different context that does not take part in it.  Would
> quiescing the transmit path at the top of the handler (netif_tx_disable()=
)
> and waking at the end make the wake unloseable?
>
> Related: lp->tx_bd_ci and lp->tx_bd_tail are written with plain stores by
> the worker while axienet_start_xmit() reads them unlocked
> (orig_tail_ptr =3D lp->tx_bd_tail) and WRITE_ONCEs them, so is the commen=
t's
> premise that "the ring is empty again" guaranteed to hold at the instant
> of the wake?
>
> [Severity: High]
> Can this wake undo the transmit stop that suspend installed?

Yes, and that one is a regression introduced by this patch.  The rework
skips the wake when lp->stopping is set or the device is not present,
and axienet_stop() quiesces the queue itself before tearing anything
down, which also covers a detach that races the check.  That in turn
needs axienet_open() to start the queue, which it currently never does.

>
> The worker checks lp->stopping only at its entry.  If a suspend starts
> after that check:
>
> axienet_suspend()
>         netif_device_detach(ndev);
>
>         rtnl_lock();
>         axienet_stop(ndev);
>         rtnl_unlock();
>
> net/core/dev.c:netif_device_detach() {
>         if (test_and_clear_bit(__LINK_STATE_PRESENT, &dev->state) &&
>             netif_running(dev)) {
>                 netif_tx_stop_all_queues(dev);
>         }
> }
>
> axienet_stop() then sets lp->stopping and blocks:
>
>                 WRITE_ONCE(lp->stopping, true);
>                 flush_work(&lp->dma_err_task);
>                 ...
>                 axienet_dma_bd_release(ndev);
>
> The already-running worker reaches the new netif_wake_queue(), clearing
> the DRV_XOFF that detach set and scheduling the qdisc.  Suspend calls
> axienet_stop() directly without dev_deactivate(), so the qdisc is still
> active, and the transmit path does not consult netif_device_present().
> Can backlogged traffic then enter axienet_start_xmit() after flush_work()
> returns, while axienet_stop() proceeds through napi_disable(),
> axienet_dma_stop(), free_irq() and axienet_dma_bd_release(), so that the
> in-flight transmit writes into lp->tx_bd_v as it is being dma_free'd and
> kicks XAXIDMA_TX_TDESC on a torn-down engine?
>
> Before this patch the detach-installed DRV_XOFF stayed set, so no xmit
> could run.  Would re-checking lp->stopping (or netif_device_present())
> before the wake close this?
>
> [Severity: Low]
> This isn't a bug introduced by this patch, but the hardware reset result
> is discarded on this path.  __axienet_device_reset() returns -ETIMEDOUT
> when the DMA reset bit never clears or PhyRstCmplt never arrives:
>
>         if (ret) {
>                 dev_err(lp->dev, "%s: timeout waiting for PhyRstCmplt\n",=
 __func__);
>                 goto out;
>         }
>
> but axienet_dma_stop() drops it:
>
>         /* Do a reset to ensure DMA is really stopped */
>         axienet_lock_mii(lp);
>         __axienet_device_reset(lp);
>         axienet_unlock_mii(lp);
>
> so the handler cannot tell a recovered device from one still in reset, an=
d
> it unconditionally re-enables XAE_OPTION_TXEN via
> axienet_setoptions(ndev, lp->options) just above the new wake.  The added
> netif_wake_queue() does not make this worse - transmits already reached t=
he
> possibly-unreset engine in the common case where the queue was not stoppe=
d
> when the error hit - but should axienet_dma_stop() propagate the reset
> failure instead of returning void?

I agree, but what the handler should do when the reset fails is a
separate decision, so I would rather leave it for a follow-up than make
it here.
This becomes a short series: start the queue in axienet_open(), quiesce
it in axienet_stop(), quiesce it across the error reset, and reprogram
the link afterwards.  v2 follows.  On hardware it passes traffic and
survives repeated down/up cycles and module reloads with traffic
running; the error path itself was not exercised.

>
> [Severity: High]
> This is a pre-existing issue, but the ring teardown earlier in this same
> handler has no exclusion against axienet_start_xmit(), which the commit
> message acknowledges below the --- line.  The handler does, for every TX
> descriptor:
>
>                 if (cur_p->skb)
>                         dev_kfree_skb_irq(cur_p->skb);
>                 cur_p->phys =3D 0;
>                 ...
>                 cur_p->skb =3D NULL;
>
> while the transmitter publishes the skb and then dereferences it:
>
>         cur_p->skb =3D skb;
>         ...
>         WRITE_ONCE(lp->tx_bd_tail, new_tail_ptr);
>         netdev_sent_queue(ndev, skb->len);
>
> Disabling TX NAPI excludes completion processing, not ndo_start_xmit.  If
> the worker frees that skb between the two, is the skb->len read a
> use-after-free, and does the following tail publication plus
> XAXIDMA_TX_TDESC kick submit descriptors whose mappings the worker alread=
y
> released?
>
> [Severity: High]
> This isn't a bug introduced by this patch, but is the MAC fully
> reprogrammed at the point where the queue is now woken?

No, the link speed and pause settings are lost.  The rework has the
handler call phylink_mac_change() so that axienet_mac_link_up() runs
again.

>
> axienet_dma_stop() runs __axienet_device_reset(), which resets the
> Ethernet core, and the recovery sequence restores RCW1, IS/IE, FCC (FCRX
> only), the MAC address, the multicast filter and lp->options.  It never
> rewrites XAE_EMMC_OFFSET.  The only writer of the LINKSPEED field and of
> the negotiated pause bits is axienet_mac_link_up():
>
>         emmc_reg &=3D ~XAE_EMMC_LINKSPEED_MASK;
>         ...
>         axienet_iow(lp, XAE_EMMC_OFFSET, emmc_reg);
>
> and phylink will not call it again because the link state has not changed
> (axienet_mac_link_down() is a no-op and the handler does not re-trigger
> phylink).  axienet_options[] has no XAE_EMMC_OFFSET entry either, so
> axienet_setoptions() cannot repair it.
>
> On a 10/100 link, does the MAC keep its reset-default link speed after
> this recovery while software still believes the negotiated rate is in
> effect, so that the frames the new netif_wake_queue() lets through are
> clocked at the wrong rate until an unrelated link flap re-runs
> axienet_mac_link_up()?  The open path escapes this only because
> axienet_open() runs phylink_start() after axienet_device_reset().
>
> >  }
> >
> >  /**
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260917121306.23499-1-maimon.sagi%40gmail.com
