Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711E85581F2;
	Thu, 10 Sep 2026 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061078; cv=none; b=KOjJGaYEKe0Um5acm7aV+coOe/6cs0CL7VOXVgqphqwV3viZk3aySZvsCMm7mAExJruoMRC+O7Oq0KCOaRCtVK3W7oZJKRTHsmNv93/NNWV6aqCDwk/jBl6yHEKIRDVOv83H23Sigj4QlGxdZnUheTCTfrNDcOzf2M0i7ZkW6ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061078; c=relaxed/simple;
	bh=kDSlOSxYXn4i7eskYwk2cbQr5brn38eq0khHDeL68P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgH1LyU+Vwz94kTE08VnMq6YCXadZ1hYqNYT6Jihr9v7ZcAXzguASDxF/tOnRudadt+2ePwWwi9fsxBsHtb2JDQtbuaDjUBFcxVb6EnyTzZsGzasg9iItj45k0CuoawDs7KVDCHmr2vQS3cuyemZ3rXVRQ00SGwiNpMzBmaRR5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iT85ktt8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iT85ktt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287EF1F000FF;
	Thu, 10 Sep 2026 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061054;
	bh=qn8hFN5rKBhABa3XAcHvvYhgH6PEosaVNMpxcicmSBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iT85ktt8BBcI+CXHcmVtjeYT5SG28NniNfDLGlFmDE0zz4teXui/CW+aHsh0GQCy6
	 w9sJeAGHsgah++0g1E2DmzGL1MJ69rJCYUmTv16Rl3HouSvNidmtzrPdnbsCN0S/Nv
	 /OyOKNAUmBVCAAmVe0REXfNfpJNi5OBrQ2GAVXdu5HSWQWsO1U6IUIO3PWVViaCoY3
	 wzN3s0kSHzbKddsPsr+VK94YlFwyv5emitgvesnXES0Ywl05uwM/ps20QMe6uSF0F6
	 LiM8g3KD2dYjc4KUhboc/5pEqaWnxSG6LgQDEiE8VTxzOi/gmaTQLNADNQoDmqPoTG
	 aV1FApX2CkftA==
Message-ID: <70448c19-1ac5-4350-bdcc-eb3ebd008992@kernel.org>
Date: Thu, 10 Sep 2026 12:24:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Content-Language: en-US
To: "S, Sanath" <Sanath.S@amd.com>,
 "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
 "Martinez, Juan" <Juan.Martinez@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "westeri@kernel.org" <westeri@kernel.org>,
 "SP, Prakruthi" <Prakruthi.SP@amd.com>
Cc: "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
 "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260831130638.GK124825@black.igk.intel.com>
 <20260831161610.1322731-1-juan.martinez@amd.com>
 <ae19d381-0fcd-45fb-9e53-033c7d664d73@kernel.org>
 <20260902054800.GI106095@black.igk.intel.com>
 <21cbfbaf-ef1f-469b-a33b-8d623dd7f9a3@kernel.org>
 <MW4PR12MB7016EE093475BF1821A0046281BF2@MW4PR12MB7016.namprd12.prod.outlook.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <MW4PR12MB7016EE093475BF1821A0046281BF2@MW4PR12MB7016.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/26 09:19, S, Sanath wrote:
> 
> On 9/10/2026 12:36 AM, Mario Limonciello wrote:
>> On 9/2/26 00:48, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Tue, Sep 01, 2026 at 05:16:03PM -0500, Mario Limonciello wrote:
>>>> On 8/31/26 11:16, juan.martinez@amd.com wrote:
>>>>> From: Juan Martinez <juan.martinez@amd.com>
>>>>>
>>>>> Commit f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on
>>>>> DMA path teardown for AMD USB4 routers") introduced a deadlock when
>>>>> physically unplugging a Thunderbolt cable on AMD systems.
>>>>>
>>>>> The problem occurs because tb_handle_hotplug() holds tb->lock while
>>>>> processing the unplug event. When it removes the XDomain services,
>>>>> tbnet_remove() calls tb_xdomain_disable_paths() which eventually calls
>>>>> tb_domain_reset_interface(). That function tries to acquire tb->lock
>>>>> via guard(mutex), but the hotplug worker already holds it, causing a
>>>>> self-deadlock.
>>>>>
>>>>> The deadlock manifests as a complete network hang because
>>>>> tb_handle_hotplug() holds RTNL while waiting on its own mutex, blocking
>>>>> all network operations system-wide.
>>>>>
>>>>> The existing code already handles this scenario partially: when
>>>>> xd->is_unplugged is true, tb_disconnect_xdomain_paths() intentionally
>>>>> skips the DMA teardown because the hotplug handler tears down the DMA
>>>>> tunnels itself. However, the reset was still being called
>>>>> unconditionally.
>>>>>
>>>>> Fix this by splitting tb_domain_reset_interface() into a locked inner
>>>>> function and a locking wrapper. Skip the reset from
>>>>> tb_domain_disconnect_xdomain_paths() when xd->is_unplugged is true, and
>>>>> instead reset the interface after the hotplug handler tears down the DMA
>>>>> tunnel while already holding tb->lock.
>>>>>
>>>>> Handle both unplug topologies: reset after the direct XDomain teardown,
>>>>> and after invalid DMA tunnels are removed when an upstream router and its
>>>>> downstream XDomain are unplugged together.
>>>>>
>>>>> This preserves the reset behavior for normal shutdown paths while
>>>>> avoiding the deadlock during physical cable unplug.
>>>>>
>>>>> Fixes: f1de1fc5f632 ("thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers")
>>>>> Signed-off-by: Juan Martinez <juan.martinez@amd.com>
>>>>
>>>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>>>
>>>> BTW -
>>>>
>>>> I did take a look through the Sashiko feedback and the first point doesn't
>>>> matter because no pre-USB4 hosts take this quirk.
>>>>
>>>> The second point is a side effect of this reset and accepted behavior.
>>>
>>> I did not find Sashiko comments for this last version but started thinking
>>> that the way we are doing it now is quite brutal. Say we have this setup:
>>>
>>>     - Thunderbolt networking for control traffic
>>>     - One USB4STREAM for data plane
>>>
>>> The data plane comes and goes depending on the needs but what happens now
>>> is that after USB4STREAM tears down the tunnels, the whole host interface
>>> get reset so that makes the Thunderbolt networking to fail as well.
>>>
>>> Is the original hardware hang per-ring? So for example in this case without
>>> any fixes the rings for USB4STREAM would hang but the Thunderbolt
>>> networking would keep working? I would expect so bot it would be good to
>>> confirm.
> Yes, the hang is per ring. Only the reset is host interface wide, which is
> exactly the asymmetry you are pointing at.
>>>
>>> Because then I think what we can do is to revert the original fix and then
>>> handle this all in nhi.c so that we delay the reset until the rings are
>>> idle and during that time we hand off "unused" rings (until running out of
>>> them). After we find the rings to be idle we block the CM and control
>>> channel and do the reset. I don't know how many rings AMD hardware has,
>>> though.
>>>
> REG_CAPS reports hop_count = 3, so HopID 0 for the control channel and two
> usable DMA HopIDs.
>>
>> IIUC the problem ends up happening while tearing down xdomain.  So if a few xdomain tunnels are active you can hit it.
>>
>> Juan, Sanath, Basavaraj, can you please check and comment?
>>> I sketched something along those lines (only compile tested) with LLM see
>>> below. I wonder if this could work?
>>>
> We ported it and ran it on two hosts connected back to back. It does what you
> want - networking survives a second tunnel teardown - with three findings.

Does it still help with the hang though?  I would think that we can 
still hang the router from doing a stress on the first tunnel 
teardown/creation.  Could you make a script and confirm while networking 
is running?

> 
> 1) Every reset is preceded by:
> 
>       thunderbolt 0000:c6:00.6: dangling request in request_queue
>       WARNING: ctl.c:761 at tb_ctl_stop+0x7c/0xf0 [thunderbolt]
>       Workqueue: events_long tbnet_connected_work [thunderbolt_net]
>        tb_domain_pause+0x25/0x40 [thunderbolt]
>        tb_ring_start+0x325/0x4a0 [thunderbolt]
>        tbnet_connected_work+0xd9/0x3b0 [thunderbolt_net]
> 
>     8 out of 8 cycles. tb_ring_start() runs from service driver context while
>     the XDomain exchange still has control requests outstanding.
> 
> 2) With two DMA HopIDs and tbnet holding one, the second tunnel gets -EBUSY
>     from the second iteration on and stays that way until the last DMA ring
>     stops. Unplug and replug recovers it, so it is more a consequence of the
>     hop count than a bug, but tbnet has to go down to get the tunnel back.
> 
> 3) tb_domain_pause() takes tb->lock from tb_ring_start(), while unplug holds
>     tb->lock across tbnet_remove() -> stop_login() ->
>     cancel_work_sync(&net->connected_work) and connected_work waits for
>     tb->lock. That is the same deadlock in a different place.
> 
> The variant below keeps your bitmap but moves the reset into a per-NHI work
> item scheduled from tb_ring_stop() when the last DMA ring stops, so nothing
> takes tb->lock or sleeps in a service driver callback, and
> tb_domain_pause()/unpause() are not needed. On the same two hosts:
> 
>   - 8 x ifdown/ifup: 8/8 up, 8 resets, 0 WARNINGs (was 8 of 8).
>   - tbnet + second tunnel: same behaviour as yours, and the reset now happens
>     by itself as soon as tbnet goes down.
>   - 3 x disconnect/reconnect: 3/3 up, 0 WARNINGs, no hung tasks.
> 
> static void nhi_reset_work(struct work_struct *work)
> {
>      struct tb_nhi *nhi = container_of(work, struct tb_nhi, reset_work);
>      struct tb *tb = dev_get_drvdata(nhi->dev);
> 
>      guard(mutex)(&tb->lock);
> 
>      scoped_guard(spinlock_irq, &nhi->lock) {
>          if (nhi->going_away)
>              return;
>          if (bitmap_empty(nhi->dma_hops_used, nhi->hop_count))
>              return;
>          if (nhi_dma_rings_running(nhi))
>              return;
>      }
> 
>      tb_ctl_stop(tb->ctl);
>      nhi_reset_interface(nhi);
>      tb_ctl_start(tb->ctl);
> 
>      scoped_guard(spinlock_irq, &nhi->lock)
>          bitmap_zero(nhi->dma_hops_used, nhi->hop_count);
> }
> 
> and schedule it from tb_ring_stop() once the last DMA ring is gone:
> 
>      ring->running = false;
> 
>      if (ring->nhi->dma_hops_used && ring_is_dma(ring) &&
>          !nhi_dma_rings_running(ring->nhi))
>          needs_reset = true;
>   err:
>      spin_unlock(&ring->lock);
>      spin_unlock_irq(&ring->nhi->lock);
> 
>      if (needs_reset)
>          schedule_work(&ring->nhi->reset_work);
> 
> Plus INIT_WORK() in nhi_probe(), cancel_work_sync() in nhi_shutdown(), and
> tb_domain_pause()/tb_domain_unpause() dropped. The rest of your sketch is
> unchanged. I can post it as a proper patch if you want to look at it in full.
>>> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
>>> index b6f5079cdf6f..1564ce6fca37 100644
>>> --- a/drivers/thunderbolt/domain.c
>>> +++ b/drivers/thunderbolt/domain.c
>>> @@ -671,6 +671,32 @@ int tb_domain_runtime_resume(struct tb *tb)
>>>        return 0;
>>>    }
>>>    +/**
>>> + * tb_domain_pause() - Pause the domain
>>> + * @tb: Domain to pause
>>> + *
>>> + * Blocks the connection manager and stops the control channel so that
>>> + * the caller can touch the host interface hardware behind its back.
>>> + * Takes @tb->lock.
>>> + *
>>> + * Once done whatever operations needed call tb_domain_unpause().
>>> + */
>>> +void tb_domain_pause(struct tb *tb)
>>> +{
>>> +    mutex_lock(&tb->lock);
>>> +    tb_ctl_stop(tb->ctl);
>>> +}
>>> +
>>> +/**
>>> + * tb_domain_unpause() - Resume paused domain
>>> + * @tb: Domain to unpause
>>> + */
>>> +void tb_domain_unpause(struct tb *tb)
>>> +{
>>> +    tb_ctl_start(tb->ctl);
>>> +    mutex_unlock(&tb->lock);
>>> +}
>>> +
>>>    /**
>>>     * tb_domain_disapprove_switch() - Disapprove switch
>>>     * @tb: Domain the switch belongs to
>>> @@ -835,21 +861,6 @@ int tb_domain_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>>>                transmit_ring, receive_path, receive_ring);
>>>    }
>>>    -static void tb_domain_reset_interface(struct tb *tb)
>>> -{
>>> -    struct tb_nhi *nhi = tb->nhi;
>>> -
>>> -    if (!nhi->ops->reset_interface)
>>> -        return;
>>> -
>>> -    guard(mutex)(&tb->lock);
>>> -
>>> -    /* The reset clears the ring state so stop the control channel */
>>> -    tb_ctl_stop(tb->ctl);
>>> -    nhi->ops->reset_interface(nhi);
>>> -    tb_ctl_start(tb->ctl);
>>> -}
>>> -
>>>    /**
>>>     * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
>>>     * @tb: Domain disabling the DMA paths
>>> @@ -872,20 +883,11 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
>>>                           int transmit_path, int transmit_ring,
>>>                           int receive_path, int receive_ring)
>>>    {
>>> -    int ret;
>>> -
>>>        if (!tb->cm_ops->disconnect_xdomain_paths)
>>>            return -ENOTSUPP;
>>>    -    ret = tb->cm_ops->disconnect_xdomain_paths(tb, xd, transmit_path,
>>> +    return tb->cm_ops->disconnect_xdomain_paths(tb, xd, transmit_path,
>>>                transmit_ring, receive_path, receive_ring);
>>> -    if (ret)
>>> -        return ret;
>>> -
>>> -    if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
>>> -        tb_domain_reset_interface(tb);
>>> -
>>> -    return 0;
>>>    }
>>>      static int disconnect_xdomain(struct device *dev, void *data)
>>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>>> index a7e6184cdfe1..423e7dba473c 100644
>>> --- a/drivers/thunderbolt/nhi.c
>>> +++ b/drivers/thunderbolt/nhi.c
>>> @@ -523,9 +523,45 @@ irqreturn_t ring_msix(int irq, void *data)
>>>        return IRQ_HANDLED;
>>>    }
>>>    +static bool ring_is_dma(const struct tb_ring *ring)
>>> +{
>>> +    return ring->hop >= RING_FIRST_USABLE_HOPID;
>>> +}
>>> +
>>> +static bool nhi_dma_rings_running(const struct tb_nhi *nhi)
>>> +{
>>> +    int i;
>>> +
>>> +    lockdep_assert_held(&nhi->lock);
>>> +
>>> +    /*
>>> +     * Holding nhi->lock is enough here because tb_ring_start() and
>>> +     * tb_ring_stop() both hold it when they update ring->running.
>>> +     */
>>> +    for (i = RING_FIRST_USABLE_HOPID; i < nhi->hop_count; i++) {
>>> +        if (nhi->tx_rings[i] && nhi->tx_rings[i]->running)
>>> +            return true;
>>> +        if (nhi->rx_rings[i] && nhi->rx_rings[i]->running)
>>> +            return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +static bool nhi_avoid_used_dma_rings(const struct tb_nhi *nhi)
>>> +{
>>> +    lockdep_assert_held(&nhi->lock);
>>> +
>>> +    if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
>>> +        return false;
>>> +
>>> +    return nhi_dma_rings_running(nhi);
>>> +}
>>> +
>>>    static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
>>>    {
>>>        unsigned int start_hop = RING_FIRST_USABLE_HOPID;
>>> +    bool avoid_used;
>>>        int ret = 0;
>>>          if (nhi->quirks & QUIRK_E2E) {
>>> @@ -539,6 +575,8 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
>>>          spin_lock_irq(&nhi->lock);
>>>    +    avoid_used = nhi_avoid_used_dma_rings(nhi);
>>> +
>>>        if (ring->hop < 0) {
>>>            unsigned int i;
>>>    @@ -547,6 +585,8 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
>>>             * range 1 .. hop_count - 1.
>>>             */
>>>            for (i = start_hop; i < nhi->hop_count; i++) {
>>> +            if (avoid_used && test_bit(i, nhi->dma_hops_used))
>>> +                continue;
>>>                if (ring->is_tx) {
>>>                    if (!nhi->tx_rings[i]) {
>>>                        ring->hop = i;
>>> @@ -559,6 +599,13 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
>>>                    }
>>>                }
>>>            }
>>> +
>>> +        if (ring->hop < 0 && avoid_used) {
>>> +            dev_warn(nhi->dev,
>>> +                 "out of HopIDs that do not need a host interface reset\n");
>>> +            ret = -EBUSY;
>>> +            goto err_unlock;
>>> +        }
>>>        }
>>>          if (ring->hop > 0 && ring->hop < start_hop) {
>>> @@ -583,6 +630,15 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
>>>            ret = -EBUSY;
>>>            goto err_unlock;
>>>        }
>>> +    /* Automatic allocation above already skips the used HopIDs */
>>> +    if (avoid_used && ring_is_dma(ring) &&
>>> +        test_bit(ring->hop, nhi->dma_hops_used)) {
>>> +        dev_warn(nhi->dev,
>>> +             "hop %d needs a host interface reset before reuse\n",
>>> +             ring->hop);
>>> +        ret = -EBUSY;
>>> +        goto err_unlock;
>>> +    }
>>>          if (ring->is_tx)
>>>            nhi->tx_rings[ring->hop] = ring;
>>> @@ -710,6 +766,62 @@ struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
>>>    }
>>>    EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
>>>    +/**
>>> + * nhi_reset_interface() - Reset the host interface
>>> + * @nhi: Host interface to reset
>>> + *
>>> + * Brings the registers in the memory BAR back to their default state and
>>> + * clears the End-to-End Flow Control state. The caller is responsible for
>>> + * stopping the control channel over the reset because it clears the ring
>>> + * state as well.
>>> + */
>>> +static void nhi_reset_interface(struct tb_nhi *nhi)
>>> +{
>>> +    u32 val;
>>> +
>>> +    val = ioread32(nhi->iobase + REG_CAPS);
>>> +    /* Only v1 host interfaces implement the reset */
>>> +    if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
>>> +        return;
>>> +
>>> +    dev_dbg(nhi->dev, "issuing host interface reset\n");
>>> +
>>> +    iowrite32(REG_HOST_INTERFACE_RESET_RST,
>>> +          nhi->iobase + REG_HOST_INTERFACE_RESET);
>>> +    /* Wait for tHIReset (10 ms) to complete */
>>> +    usleep_range(10000, 20000);
>>> +}
>>> +
>>> +static void nhi_reset_quirk(struct tb_ring *ring)
>>> +{
>>> +    struct tb_nhi *nhi = ring->nhi;
>>> +    struct tb *tb = dev_get_drvdata(nhi->dev);
>>> +
>>> +    if (!(nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN))
>>> +        return;
>>> +    if (!ring_is_dma(ring))
>>> +        return;
>>> +
>>> +    scoped_guard(spinlock_irq, &nhi->lock) {
>>> +        if (nhi->going_away)
>>> +            return;
>>> +        if (bitmap_empty(nhi->dma_hops_used, nhi->hop_count))
>>> +            return;
>>> +        /*
>>> +         * If any of the DMA rings are still running we cannot
>>> +         * do the reset.
>>> +         */
>>> +        if (nhi_dma_rings_running(nhi))
>>> +            return;
>>> +
>>> +        bitmap_zero(nhi->dma_hops_used, nhi->hop_count);
>>> +    }
>>> +
>>> +    /* CM must be blocked before host interface reset can be done */
>>> +    scoped_guard(tb_domain_paused, tb)
>>> +        nhi_reset_interface(nhi);
>>> +}
>>> +
>>>    /**
>>>     * tb_ring_start() - enable a ring
>>>     * @ring: Ring to start
>>> @@ -721,6 +833,8 @@ void tb_ring_start(struct tb_ring *ring)
>>>        u16 frame_size;
>>>        u32 flags;
>>>    +    nhi_reset_quirk(ring);
>>> +
>>>        spin_lock_irq(&ring->nhi->lock);
>>>        spin_lock(&ring->lock);
>>>        if (ring->nhi->going_away)
>>> @@ -781,6 +895,8 @@ void tb_ring_start(struct tb_ring *ring)
>>>        if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
>>>            ring_interrupt_active(ring, true);
>>>        ring->running = true;
>>> +    if (ring->nhi->dma_hops_used && ring_is_dma(ring))
>>> +        __set_bit(ring->hop, ring->nhi->dma_hops_used);
>>>    err:
>>>        spin_unlock(&ring->lock);
>>>        spin_unlock_irq(&ring->nhi->lock);
>>> @@ -1241,32 +1357,6 @@ static void nhi_reset(struct tb_nhi *nhi)
>>>        dev_warn(nhi->dev, "timeout resetting host router\n");
>>>    }
>>>    -/**
>>> - * nhi_reset_interface() - Reset the host interface
>>> - * @nhi: Host interface to reset
>>> - *
>>> - * Brings the registers in the memory BAR back to their default state and
>>> - * clears the End-to-End Flow Control state. The caller is responsible for
>>> - * stopping the control channel over the reset because it clears the ring
>>> - * state as well.
>>> - */
>>> -void nhi_reset_interface(struct tb_nhi *nhi)
>>> -{
>>> -    u32 val;
>>> -
>>> -    val = ioread32(nhi->iobase + REG_CAPS);
>>> -    /* Only v1 host interfaces implement the reset */
>>> -    if (FIELD_GET(REG_CAPS_VERSION_MASK, val) >= REG_CAPS_VERSION_2)
>>> -        return;
>>> -
>>> -    dev_dbg(nhi->dev, "issuing host interface reset\n");
>>> -
>>> -    iowrite32(REG_HOST_INTERFACE_RESET_RST,
>>> -          nhi->iobase + REG_HOST_INTERFACE_RESET);
>>> -    /* Wait for tHIReset (10 ms) to complete */
>>> -    usleep_range(10000, 20000);
>>> -}
>>> -
>>>    static struct tb *nhi_select_cm(struct tb_nhi *nhi)
>>>    {
>>>        bool linked = false;
>>> @@ -1331,6 +1421,13 @@ int nhi_probe(struct tb_nhi *nhi)
>>>        if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
>>>            return -ENOMEM;
>>>    +    if (nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN) {
>>> +        nhi->dma_hops_used = devm_bitmap_zalloc(dev, nhi->hop_count,
>>> +                            GFP_KERNEL);
>>> +        if (!nhi->dma_hops_used)
>>> +            return -ENOMEM;
>>> +    }
>>> +
>>>        nhi_reset(nhi);
>>>          /* In case someone left them on. */
>>> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
>>> index b2e2e2c413b2..53374c12b685 100644
>>> --- a/drivers/thunderbolt/nhi.h
>>> +++ b/drivers/thunderbolt/nhi.h
>>> @@ -36,7 +36,6 @@ irqreturn_t nhi_msi(int irq, void *data);
>>>    irqreturn_t ring_msix(int irq, void *data);
>>>    int nhi_probe(struct tb_nhi *nhi);
>>>    void nhi_shutdown(struct tb_nhi *nhi);
>>> -void nhi_reset_interface(struct tb_nhi *nhi);
>>>      extern const struct dev_pm_ops nhi_pm_ops;
>>>    @@ -55,7 +54,6 @@ extern const struct dev_pm_ops nhi_pm_ops;
>>>     * @release_ring_irq: NHI specific interrupt release hook
>>>     * @is_present: Whether the device is currently present on the parent bus
>>>     * @init_interrupts: NHI specific interrupt initialization hook
>>> - * @reset_interface: Resets the host interface
>>>     */
>>>    struct tb_nhi_ops {
>>>        int (*init)(struct tb_nhi *nhi);
>>> @@ -71,7 +69,6 @@ struct tb_nhi_ops {
>>>        void (*release_ring_irq)(struct tb_ring *ring);
>>>        bool (*is_present)(struct tb_nhi *nhi);
>>>        int (*init_interrupts)(struct tb_nhi *nhi);
>>> -    void (*reset_interface)(struct tb_nhi *nhi);
>>>    };
>>>      /*
>>> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
>>> index e40d4d6af071..0a586122db47 100644
>>> --- a/drivers/thunderbolt/pci.c
>>> +++ b/drivers/thunderbolt/pci.c
>>> @@ -357,7 +357,6 @@ static const struct tb_nhi_ops pci_nhi_default_ops = {
>>>        .shutdown = nhi_pci_release_irq,
>>>        .is_present = nhi_pci_is_present,
>>>        .init_interrupts = nhi_pci_init_msi,
>>> -    .reset_interface = nhi_reset_interface,
>>>    };
>>>      /* Ice Lake specific NHI operations */
>>> @@ -576,7 +575,6 @@ static const struct tb_nhi_ops icl_nhi_ops = {
>>>        .release_ring_irq = nhi_pci_ring_release_msix,
>>>        .is_present = nhi_pci_is_present,
>>>        .init_interrupts = nhi_pci_init_msi,
>>> -    .reset_interface = nhi_reset_interface,
>>>    };
>>>      static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
>>> index 1f78e2528c05..268bc7d90267 100644
>>> --- a/drivers/thunderbolt/tb.h
>>> +++ b/drivers/thunderbolt/tb.h
>>> @@ -826,6 +826,10 @@ int tb_domain_thaw_noirq(struct tb *tb);
>>>    void tb_domain_complete(struct tb *tb);
>>>    int tb_domain_runtime_suspend(struct tb *tb);
>>>    int tb_domain_runtime_resume(struct tb *tb);
>>> +void tb_domain_pause(struct tb *tb);
>>> +void tb_domain_unpause(struct tb *tb);
>>> +DEFINE_GUARD(tb_domain_paused, struct tb *, tb_domain_pause(_T),
>>> +         tb_domain_unpause(_T))
>>>    int tb_domain_disapprove_switch(struct tb *tb, struct tb_switch *sw);
>>>    int tb_domain_approve_switch(struct tb *tb, struct tb_switch *sw);
>>>    int tb_domain_approve_switch_key(struct tb *tb, struct tb_switch *sw);
>>> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
>>> index 69839a514433..e1c270496cf6 100644
>>> --- a/include/linux/thunderbolt.h
>>> +++ b/include/linux/thunderbolt.h
>>> @@ -537,6 +537,9 @@ void tb_service_properties_changed(struct tb_service *svc);
>>>     *            MSI-X is used.
>>>     * @hop_count: Number of rings (end point hops) supported by NHI.
>>>     * @quirks: NHI specific quirks if any
>>> + * @dma_hops_used: Bitmap of HopIDs that have been programmed after the
>>> + *           last host interface reset. Used only with
>>> + *           %QUIRK_RESET_DMA_ON_TEARDOWN.
>>>     * @domain_released: Completed when domain has been fully released
>>>     * @host_reset: Host router was reset on driver load, or forced on system
>>>     *        shutdown/reboot. When set, tb_stop() asserts DPR on connected
>>> @@ -557,6 +560,7 @@ struct tb_nhi {
>>>        struct work_struct interrupt_work;
>>>        u32 hop_count;
>>>        unsigned long quirks;
>>> +    unsigned long *dma_hops_used;
>>>        struct completion domain_released;
>>>        bool host_reset;
>>>    };
>>

