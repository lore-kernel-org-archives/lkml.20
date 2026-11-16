Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837298;
	b=RbQ4IxiR3Q5NA+J+0Lksx6b7BYp8sMg0FDgChYqAuyf81vc7lWlequ+ANZ8MBQ9X0fiH
	 +oFsHnQxEbq/cRU6sET4EeUiggRsFhen9nlIJUYl9sQR6+PQIR3zJmlEmAK6/1m4rlT/h
	 TPncUBFLSUdwBhz603hUVUG46fynrc8DTjC6w/MgnfuxVWSCNHzJd0V1KfKogM1jyTvIT
	 ArS+i9drK2ld4eBxa780TzA79jsBFi7z6fzSEB34364y/+479aB7gAKe+35M2OLS2nO7V
	 MQSuhDFl11za92O42+GmSF7HUsjuMw2uCH4Y9v9PInnca5UwI7F/PyRA0DtymrPJ5/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837298;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=sH9EoF3y3PwkNzHE9P8W3rzR252QQQXfryRL6m4S+vU=;
	b=zew/DwpVPCxnjXTuHdQfQD78mJGskDw9hrKcf1RFt2YMS7RTr9RRbuc+BdFKZpDsX+Gj
	 mFS63W4ZJKuyzXnHoNx9TwdqAxlxuwR6KA5x7s566o4ghhXoDOiehQsxpRxjaiDggnsLd
	 UZncbO47tr0MRg++bN7gPXcNqcEIzTprP/T/WOV8gPK8xPt0kBs3Qvsxx41DUBHcEeHIt
	 8R21LRUuDjSAEDveP25A+CTDRDES3oQxL+r4YPwxrvhdsujjqypYK1parCbKtK/PZ1RMI
	 5ZaTl8w8qWmTvOlCuEoMr1gX+7vydx9sv0D5XpdNcJvMaNxSf24OQtTFdWP4TJ4ACUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fb2xwOHD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB3F606C7DD;
	Mon, 16 Nov 2026 13:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fb2xwOHD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221591F000CB;
	Mon, 16 Nov 2026 13:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837297;
	bh=sH9EoF3y3PwkNzHE9P8W3rzR252QQQXfryRL6m4S+vU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fb2xwOHDr8dEYZIbwmTuTcqWRbmJ8pP+/QqjFKHZ+ofUtgBBd44FybxfXL0bbSkGV
	 cr0pFPeEQgAWO7sj6wlnuSb5W44kafPdw4saEH4FsF7PNHe2GyouqcZvz6rxOQLYIe
	 WXFkP0B5zncg14bYaLliS8QbJseBK6Ng0aW3NzuG2bIT+cTP0r6Sw66regSq+r+8w2
	 JE6sfKqLmVLMg9PbOb0JNpdfEvUdHDQ097ZzK9hYerUDcNbWI/pAh7DaWGFLMvSdMr
	 V0a3Nj7hwQsBF1AJs9ES/WA2A7X/P1TGA4Wbm5aNbOVbW0lUw9kRchn0Atf9Vt67v5
	 cixg1FMer2fFg==
Subject:
 Re: [PATCH net 1/1] net: usb: rtl8150: break cycle between tasklet and URB
From: netdev-bot+sashiko@kernel.org
To: oneukum@suse.com
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 13:54:56 +0000
Message-ID: <179483729664.3136.4388138299091568521@kernel.org>
In-Reply-To: <20261112104548.693456-1-oneukum@suse.com>
References: <20261112104548.693456-1-oneukum@suse.com>
X-sashiko-severity: Critical
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 1 · High: 2 (1) · Medium: 3 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Critical] The new RTL8150_UNPLUG check under rx_pool_lock in
  read_bulk_callback() (line 443) runs after netif_rx(dev->rx_skb) (line…
- [High] The patch turns unlink_all_urbs() from usb_kill_urb() into
  usb_poison_urb().
- [High] rtl8150_disconnect() relies on tasklet_kill() to stop
  rx_fixup(), but once the URBs are poisoned rx_fixup() reschedules…
- [Medium] intr_callback() in drivers/net/usb/rtl8150.c changes `else if
  (res)` to `else if (res != -EPERM)`.
- [Medium] The patch adds a counting protocol on urb->reject:
  alloc_all_urbs() blocks (+1), rtl8150_open() calls reenable_all_urbs()…
- [Medium] The commit message says only that the URBs are poisoned to
  stop the tasklet<->URB resubmission cycle.

Pre-existing issues:
- [High] Pre-existing stale rx_skb ownership bug (this problem wasn't
  introduced by this patch, but it can corrupt memory).

--

net: usb: rtl8150: break cycle between tasklet and URB

This patch switches unlink_all_urbs() from usb_kill_urb() to
usb_poison_urb(). The URBs are blocked at allocation time and unblocked in
rtl8150_open(). It also adds an RTL8150_UNPLUG check in
read_bulk_callback(), changes the intr_callback() error check, and
reorders rtl8150_disconnect() so it poisons the URBs and kills the tasklet
a second time before unregister_netdev().

> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index d51e43170e033..846e6329d571c 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c

[ ... ]

> @@ -353,11 +360,18 @@ static void free_all_urbs(rtl8150_t * dev)
>  	usb_free_urb(dev->intr_urb);
>  }
>  
> +static void reenable_all_urbs(rtl8150_t *dev)
> +{
> +	usb_unpoison_urb(dev->rx_urb);
> +	usb_unpoison_urb(dev->tx_urb);
> +	usb_unpoison_urb(dev->intr_urb);
> +}
> +
>  static void unlink_all_urbs(rtl8150_t * dev)
>  {
> -	usb_kill_urb(dev->rx_urb);
> -	usb_kill_urb(dev->tx_urb);
> -	usb_kill_urb(dev->intr_urb);
> +	usb_poison_urb(dev->rx_urb);
> +	usb_poison_urb(dev->tx_urb);
> +	usb_poison_urb(dev->intr_urb);
>  }

[Severity: High]
unlink_all_urbs() is also called from rtl8150_close(). That function does
not kill the tasklet and does not set RTL8150_UNPLUG:

drivers/net/usb/rtl8150.c:rtl8150_close() {
	netif_stop_queue(netdev);
	if (!test_bit(RTL8150_UNPLUG, &dev->flags))
		disable_net_traffic(dev);
	unlink_all_urbs(dev);
	...
}

After close, rx_urb now stays poisoned until the next open. The rx_fixup()
tasklet may still be pending at that point. read_bulk_callback() schedules
it whenever the 4-entry pool is empty, which happens often under RX load.
If it then runs, it gets -EPERM and handles it like any other error:

drivers/net/usb/rtl8150.c:rx_fixup() {
	...
	if (test_bit(RX_URB_FAIL, &dev->flags))
		if (dev->rx_skb)
			goto try_again;
	...
try_again:
	status = usb_submit_urb(dev->rx_urb, GFP_ATOMIC);
	if (status == -ENODEV) {
		netif_device_detach(dev->netdev);
	} else if (status) {
		set_bit(RX_URB_FAIL, &dev->flags);
		goto tlsched;
	...
tlsched:
	tasklet_schedule(&dev->tl);
}

Does this leave the tasklet rescheduling itself forever on a downed
interface, until open() unpoisons the URB or disconnect() kills the
tasklet? With usb_kill_urb(), submissions were only blocked while the kill
was in progress, so this loop could not form.

Could the cycle be broken inside rx_fixup() instead, by treating -EPERM as
terminal? Or could rtl8150_close() quiesce the tasklet?

> @@ -425,6 +439,11 @@ static void read_bulk_callback(struct urb *urb)
>  	netdev->stats.rx_bytes += pkt_len;
>  
>  	spin_lock_irqsave(&dev->rx_pool_lock, flags);
> +	/* prevent an eteral loop */
> +	if (test_bit(RTL8150_UNPLUG, &dev->flags)) {
> +		spin_unlock_irqrestore(&dev->rx_pool_lock, flags);
> +		return;
> +	}

[Severity: Critical]
This check runs after netif_rx(dev->rx_skb) has already handed the skb to
the stack. The early return skips the dev->rx_skb = skb assignment, so
dev->rx_skb still points at an skb the stack now owns.

Can this sequence double free the skb?

CPU1 read_bulk_callback()
  test_bit(RTL8150_UNPLUG) -> clear
  netif_rx(dev->rx_skb)
                            CPU2 rtl8150_disconnect()
                              set_bit(RTL8150_UNPLUG, &dev->flags)
  spin_lock_irqsave(&dev->rx_pool_lock)
  test_bit(RTL8150_UNPLUG) -> set, return
                              unlink_all_urbs()  (waits for callback)
                              tasklet_kill()
                              unregister_netdev()
                              ...
                              dev_kfree_skb(dev->rx_skb)

The set_bit() in rtl8150_disconnect() is not done under rx_pool_lock, so
the lock does not serialize against it. This is the flag-as-gate pattern
described in the networking-drivers guide.

It also isn't clear what the check prevents. Without it, the resubmit
returns -EPERM and the second tasklet_kill() in disconnect handles the
scheduled tasklet.

Also, there's a typo in the comment: "eteral".

>  	skb = pull_skb(dev);
>  	spin_unlock_irqrestore(&dev->rx_pool_lock, flags);
>  	if (!skb)

[Severity: High]
This is a pre-existing issue, not introduced by this patch, but it can
corrupt memory. When pull_skb() returns NULL here, the goto resched path
leaves dev->rx_skb pointing at the skb that was just passed to netif_rx().

rx_fixup() replaces dev->rx_skb only when pull_skb() succeeds:

drivers/net/usb/rtl8150.c:rx_fixup() {
	...
	skb = pull_skb(dev);
	spin_unlock_irq(&dev->rx_pool_lock);
	if (skb == NULL)
		goto tlsched;
	dev->rx_skb = skb;
	...
}

If the atomic allocations in fill_skb_pool() keep failing, the stale
pointer stays in place.

An ifdown/ifup in that state reaches this check in rtl8150_open():

	if (dev->rx_skb == NULL)
		dev->rx_skb = pull_skb(dev);

The stale pointer is then reused as rx_urb's transfer buffer. Can the
device then DMA into a freed skb?

On disconnect, tasklet_kill() can take TASKLET_STATE_SCHED in the gap
between tasklet_clear_sched() and rx_fixup()'s own tasklet_schedule().
That ends the loop with the pointer still stale, and
dev_kfree_skb(dev->rx_skb) in rtl8150_disconnect() would free it a second
time.

The new RTL8150_UNPLUG early return above reaches the same stale state more
easily.

[ ... ]

> @@ -518,7 +537,7 @@ static void intr_callback(struct urb *urb)
>  	res = usb_submit_urb (urb, GFP_ATOMIC);
>  	if (res == -ENODEV)
>  		netif_device_detach(dev->netdev);
> -	else if (res)
> +	else if (res != -EPERM)
>  		dev_err(&dev->udev->dev,
>  			"can't resubmit intr, %s-%s/input0, status %d\n",
>  			dev->udev->bus->bus_name, dev->udev->devpath, res);

[Severity: Medium]
A successful usb_submit_urb() returns 0, which is neither -ENODEV nor
-EPERM. Won't this print "can't resubmit intr ... status 0" on every
successful resubmit of the interrupt URB?

Was this meant to be:

	else if (res && res != -EPERM)

The resubmit in read_bulk_callback() keeps the non-zero check. The commit
message doesn't mention this change.

> @@ -751,6 +770,7 @@ static int rtl8150_open(struct net_device *netdev)
>  	if (!dev->rx_skb)
>  		return -ENOMEM;
>  
> +	reenable_all_urbs(dev);
>  	set_registers(dev, IDR, 6, netdev->dev_addr);

[Severity: Medium]
reenable_all_urbs() runs before URB submissions that can fail. What happens
to urb->reject if usb_submit_urb() fails later in rtl8150_open()?

The rx_urb failure path returns directly. The intr_urb failure path only
calls usb_kill_urb(dev->rx_urb), which leaves reject unchanged.

__dev_open() does not call ndo_stop when ndo_open fails, so reject would
be left at 0 with the interface down. The next rtl8150_open() would then
take it to -1 through usb_unpoison_urb(), which is a plain atomic_dec().

usb_hcd_link_urb_to_ep() rejects any non-zero value:

drivers/usb/core/hcd.c:usb_hcd_link_urb_to_ep() {
	...
	if (unlikely(atomic_read(&urb->reject))) {
		rc = -EPERM;
	...
}

Does every later open then fail with -EPERM and push reject further
negative, until the driver is rebound or the device replugged?

A later poison in rtl8150_disconnect() would also only bring reject from -1
back to 0. The URBs would then not be blocked during teardown.

The rtl8150_close() tasklet loop above is one way to reach these error
paths. reenable_all_urbs() lets the tasklet's submit race with the submit
here, and open() can then get -EBUSY.

Should these error paths block the URBs again before returning?

[ ... ]

> @@ -969,8 +989,9 @@ static void rtl8150_disconnect(struct usb_interface *intf)
>  	if (dev) {
>  		set_bit(RTL8150_UNPLUG, &dev->flags);
>  		tasklet_kill(&dev->tl);
> -		unregister_netdev(dev->netdev);
>  		unlink_all_urbs(dev);
> +		tasklet_kill(&dev->tl);

[Severity: High]
Can these tasklet_kill() calls hang? Once the URBs are poisoned,
rx_fixup() reschedules itself on every run: -EPERM, then RX_URB_FAIL, then
tasklet_schedule().

tasklet_action_common() clears the SCHED bit right before running the
callback:

kernel/softirq.c:tasklet_action_common() {
	...
				if (tasklet_clear_sched(t)) {
					if (t->use_callback) {
						trace_tasklet_entry(t, t->callback);
						t->callback(t);
	...
}

rx_fixup() then sets the bit again through tasklet_schedule() before the
softirq run returns.

On a UP kernel, or when the disconnect task shares a CPU with ksoftirqd,
wait_on_bit_lock() in tasklet_kill() would never see the bit clear. Would
disconnect then sleep in TASK_UNINTERRUPTIBLE forever?

The loop is reliably running at disconnect time after an earlier ifdown
under RX load (see the rtl8150_close() comment above). This applies to a
soft unbind, where the device is still configured and usb_submit_urb()
returns -EPERM rather than -ENODEV. On SMP the loop can also start from an
RX completion racing the poison here.

Would it be safer to break the cycle inside rx_fixup(), by not
rescheduling on -EPERM or when RTL8150_UNPLUG is set?

> +		unregister_netdev(dev->netdev);
>  		free_all_urbs(dev);
>  		free_skb_pool(dev);
>  		dev_kfree_skb(dev->rx_skb);

[Severity: Medium]
The commit message says:

  The simplest way to do so is to prevent the resubmission
  of the URBs by poisoning them.

The patch also makes several other changes:

  - It blocks all URBs in alloc_all_urbs() and unblocks them in
    rtl8150_open(), which affects every ifup/ifdown.
  - It moves unregister_netdev() after unlink_all_urbs() and adds a
    second tasklet_kill().
  - It changes the intr_callback() error reporting.
  - It adds the RTL8150_UNPLUG check in read_bulk_callback().

Could the commit message describe these changes as well?

The reordering here also has a visible effect. On a soft unbind with the
device still configured, the netdev stays registered and running after
tx_urb is poisoned. rtl8150_start_xmit() then gets -EPERM instead of
-ENODEV and takes this branch for every packet:

		else {
			dev_warn(&netdev->dev, "failed tx_urb %d\n", res);
			netdev->stats.tx_errors++;
			netif_start_queue(netdev);
		}

This continues until unregister_netdev() closes the interface. Is that
intended?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112104548.693456-1-oneukum%40suse.com
