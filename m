Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794746239;
	b=LFQRl/vvJ5Rd+LaUFRvhD3xKc2BD9woU+CV2H3arxF6x37U0z349hhseQTDfaOtRseul
	 Zysp/FancIceVBq6HYY7fUQPoR25aOqGqGoVXhy0i2FJICxhjIkiVmsI+hmlvj8M04FuV
	 8Lkxq0plbaAfw134JllZnIErHzDNsrgupedmi8xlRbgydRpDfkFUpM6O8sH0AuZzC5lyL
	 d9CMzpKAldGItVlzhiGa8NX2ROKR2sag+dvRaSlo1fbOhX8nWrEtGiKtXDFF1N19olsSc
	 4kzmVu0lg5pr6SFKMALEvTokRjgjGRrjeDlfgMeTJy4RlWZCe7TzD+QlQSYaWyM0acQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794746239;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=2DJW9TGlzvjVKygKaa9hS/L8TMifB5wje9A1GePfQ/E=;
	b=kFAK0Q+T5oDCDjn1ThGH8121ytedp1NdVb8l1ef8VafJRCSsSUuq0vMhi+O0Tn1kjjdL
	 Ein7Z4LgWEd3TNpJRrSrm1GnsIhWwiewVvRQYTCbZOxxRJXwCDjQy7a/V9r7jKdCFfZwy
	 2CIwchLkk3SzyJe6lSCSe6Dqzc1HEeU+eVVQ2mHah15K8CK44vNQu624NZWbbZg7dW7Gx
	 YAX1S8VvyLbiwKT7G3p0AR1NkTs4vFjzfEYWOmncFWBnEOwnGqP1EBo92z3knw6qyXog9
	 GSyhlunKdfSOc8470QuRVFLhMqn/zKdVoyrRrJTxzJfjJZKi1IMjX3SebppTuEAdB5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVQSMaWL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173B606A31A;
	Sun, 15 Nov 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVQSMaWL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AC71F000C4;
	Sun, 15 Nov 2026 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794746239;
	bh=2DJW9TGlzvjVKygKaa9hS/L8TMifB5wje9A1GePfQ/E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WVQSMaWLPZfrCBFVNew7/CTBSu0U0bATNpsbDK2VH8gQtfhJXNdvrvYSa+5G3fc7o
	 M2O6PxZ0ymYphj/aH5+bHbnKsEGDocLKOoFHkE+xZAIqz3CUU3GUVOUZMm6NKm/5ZF
	 y+lvS093dtCPq/CqfweKCHBwn2tBWAGM+5shanI7iv5ydu5hYcKqtKe/fy4NN77tTE
	 0DKq8ofDXstn4bBrzl3TFKeQEA/rgPLFF4cSNKDff0o+3eQLue+OO7QQXvk9gKgRGe
	 ZewZ3IOkzLxVm5hqn9mphFKw6wtM4GUqFl472BQIvbMW0uYTqPKcn3IFWbya0t3wuF
	 9hkk8xvhtuB+w==
Subject:
 Re: [PATCH net] net: fealnx: Fix potential use-after-free during removal
From: netdev-bot+sashiko@kernel.org
To: liguangshuo@mail.sdu.edu.cn
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 12:37:18 +0000
Message-ID: <179474623827.2199510.10084653332786224058@kernel.org>
In-Reply-To: <20261111-e5624093d6-net-fealnx@mail.sdu.edu.cn>
References: <20261111-e5624093d6-net-fealnx@mail.sdu.edu.cn>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch's Fixes: tag points at the wrong commit.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but netdev_close()
  does not stop the interrupt handler and timers before it stops the…

--

net: fealnx: Fix potential use-after-free during removal

This patch moves unregister_netdev() ahead of the dma_free_coherent() calls
in fealnx_remove_one(). With that order, netdev_close() no longer walks
the tx and rx descriptor rings after they have been freed.

> Fixes: 8f1482080104 ("eth: fealnx: bring back this old driver")

[Severity: Medium]
Is this the right commit for the Fixes: tag?

Commit 8f1482080104 is a straight revert of d5e2d038dbec ("eth: fealnx:
delete the driver for Myson MTD-800"), and it only re-added the file.

Before the deletion, fealnx_remove_one() already used the same ordering:

	dma_free_coherent(&pdev->dev, TX_TOTAL_SIZE, np->tx_ring,
			  np->tx_ring_dma);
	dma_free_coherent(&pdev->dev, RX_TOTAL_SIZE, np->rx_ring,
			  np->rx_ring_dma);
	unregister_netdev(dev);

git blame at d5e2d038dbec^ attributes the function body and the
unregister_netdev() call to 1da177e4c3f4 ("Linux-2.6.12-rc2"). The
dma_free_coherent() lines come from the 2020 pci_free_consistent
conversion, 405e30e23cb3.

The driver was only deleted for v6.2. That means 6.1.y, 5.15.y and 5.10.y
still carry it, with the same use-after-free on removal. None of those
branches contain 8f1482080104, so wouldn't Fixes-based stable selection
skip them?

Would Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2"), plus
Cc: stable@vger.kernel.org, be more accurate?

> diff --git a/drivers/net/ethernet/fealnx.c b/drivers/net/ethernet/fealnx.c
> index bdc38aac58509..68194c9ef3326 100644
> --- a/drivers/net/ethernet/fealnx.c
> +++ b/drivers/net/ethernet/fealnx.c
> @@ -682,11 +682,11 @@ static void fealnx_remove_one(struct pci_dev *pdev)
>  	if (dev) {
>  		struct netdev_private *np = netdev_priv(dev);
>  
> +		unregister_netdev(dev);
>  		dma_free_coherent(&pdev->dev, TX_TOTAL_SIZE, np->tx_ring,
>  				  np->tx_ring_dma);
>  		dma_free_coherent(&pdev->dev, RX_TOTAL_SIZE, np->rx_ring,
>  				  np->rx_ring_dma);
> -		unregister_netdev(dev);
>  		pci_iounmap(pdev, np->mem);
>  		free_netdev(dev);

[Severity: High]
This is a pre-existing issue and was not introduced by this patch. Can
removal still end in a use-after-free when netdev_close() races with
intr_handler()?

netdev_close() never takes np->lock. It also calls free_irq() only after
it has stopped the chip and deleted the timers:

drivers/net/ethernet/fealnx.c:netdev_close() {
	...
	iowrite32(0x0000, ioaddr + IMR);
	stop_nic_rxtx(ioaddr, 0);
	timer_delete_sync(&np->timer);
	timer_delete_sync(&np->reset_timer);
	free_irq(np->pci_dev->irq, dev);
	...
}

The IRQ is requested with IRQF_SHARED, so intr_handler() can run on
another CPU during this whole sequence. If the handler runs out of
boguscnt after timer_delete_sync(&np->reset_timer), it re-arms the timer:

drivers/net/ethernet/fealnx.c:intr_handler() {
	...
	if (!np->reset_timer_armed) {
		np->reset_timer_armed = 1;
		np->reset_timer.expires = RUN_AT(HZ/2);
		add_timer(&np->reset_timer);
	...
}

free_irq() waits for the handler to finish, but netdev_close() then
returns with reset_timer still pending. fealnx_remove_one() goes on to
call pci_iounmap() and free_netdev(), which frees netdev_private and the
timer_list embedded in it.

About HZ/2 later, reset_timer() would take np->lock in freed memory and
do MMIO through the unmapped np->mem.

The chip can also be restarted after the stop_nic_rxtx() call in close:

  - The RBU branch in intr_handler() and the netdev_rx() error path write
    np->crvalue back to TCRRCR. netdev_close() never clears
    CR_W_RXEN/CR_W_TXEN from np->crvalue. intr_handler() also writes
    np->imrvalue back to IMR on exit.

  - If reset_timer() fires between stop_nic_rxtx() and
    timer_delete_sync(&np->reset_timer), enable_rxtx() rewrites the ring
    base addresses, turns RX/TX back on through __set_rx_mode() and
    unmasks IMR.

  - On a link-up media change, netdev_timer() can write crvalue, with the
    enable bits set, back to TCRRCR before
    timer_delete_sync(&np->timer) runs.

In addition, stop_nic_rxtx() gives up silently after 0x1000 polls. The
driver never does a BCR soft reset and never calls pci_disable_device()
or pci_clear_master().

With this patch, the coherent rings are freed right after
unregister_netdev() returns. Could a chip that is still bus mastering
then DMA into the freed rings and RX skbs?

One possible order:

  - call free_irq() first, or mask IMR under np->lock and then call
    synchronize_irq()
  - delete the timers so that reset_timer cannot be re-armed
  - do the final hardware stop
  - confirm the stop and reset the chip before the rings are released

Would that close these windows?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-e5624093d6-net-fealnx%40mail.sdu.edu.cn
