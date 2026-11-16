Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837037;
	b=kseQrwDgQhouWcVqluXoEoyCuMzkiUH+Bp/auZovnmwcc6VKpgOYjAp2Tse2fuhyouil
	 0PEkQI5w4jTqB7UsqX6s1+Hv2mQBdPk0cnCBO7wmQ9gIBCg1GI3UZxwUYgrTPOFUBe9Au
	 oN2/MoN74G0F1/bmuuhWC+/bxuwb3s6Rmu0iIO0k3w4CoikwghkwFVr7Ufdtofi4rTAe/
	 ULm4Gev+jcuFxCvdFMUhGE4rRKQfbRfhyPWsxaif6OdwSbGe/6jE67FACScBkQcLGNI8m
	 53MwmND/Vs8NWQ2KNGNFQxS7eIMgefbBHY8pxDo8mXym5zCG/wRdl9ilLwiJsJCHj8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837037;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=hwv6T4XvFybqkKrRBEo5N2TRb98sAmwv6eB4h9MLvjA=;
	b=eVJNnOXk2dnjjYNG6tOVDNoyggbg+RVTS4OUi6cwLdUck9tnZM2NaJkg50wu9u4OTenz
	 AN355XQ3pawzZHf+2aXTrevj9GRVIqm7XEgoutYk2iVxxe/qAeh7HzUQVOSrjPfo1j84v
	 C/aOYS+QtOwIgblO10+eucKbOf1Z7jDPmcZVQ02Db0NvqSGU4j2EjWcannXD8bKyZAdFQ
	 adOUYvm9WkJl6nPIK1fWJ1/Md8adj+RHEVhVRL9pib2PvgWMebIjjfnOy0n0JhW+ZnpCW
	 tampbtj0krNXdBzpJTtcaJjWxVSmssrIoaqwAFe6hYo1+SO7sP9zX7Sdx1x6YuADO8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="u3A/U4mK";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBDE606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBDE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=u3A/U4mK
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EDB14BB;
	Mon, 16 Nov 2026 14:48:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794836887;
	bh=TI+MFYg5CCUtjz8iqgnansCezaulsq0+gMmmzeIyST4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3A/U4mKZG408f12XrzebgY+NisFf1ZePFkgYDsEf2wJuDwec1cWvYyC0DRHmsB7u
	 Ig7dlLZXjGC4l2BFfd3qtlC8Ly2rIOqpLhpKtPFF96qP1wTqCaqF2FRQL1cgFvcY8P
	 XLTYvhV1i2b63zF1NsP/fG3+ZpvW+ejKidcTUQFY=
Date: Mon, 16 Nov 2026 15:50:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jussi =?utf-8?B?QWxhbsOkcsOk?= <jussi@firstview.fi>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/raspberrypi: vchiq: Store a msg_queue entry
 before publishing it
Message-ID: <20261116135032.GA1747591@killaraus.ideasonboard.com>
References: <20261116072339.2821648-1-jussi@firstview.fi>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116072339.2821648-1-jussi@firstview.fi>

On Mon, Nov 16, 2026 at 09:23:39AM +0200, Jussi Alanärä wrote:
> vchiq_msg_queue_push() advances msg_queue_write before it stores the
> header in the entry that the new index makes visible, and
> vchiq_msg_hold() advances msg_queue_read before it loads the header
> from the entry that the new index frees. Neither side orders its index
> update against its access to the entry, so on SMP the thread on the
> other side can see them in either order.
> 
> The consumer can see the new write index and load the entry before the
> producer has stored it. It then gets the header left in that entry one
> lap (VCHIQ_MAX_SLOTS messages) earlier. That message was released long
> ago and its slot recycled, so the consumer parses whatever the VPU has
> written at that address since, and then releases it. The message that
> was actually pushed is never seen and never released, so the slot that
> holds it is never recycled. In the first lap the stale entry is NULL.
> With a full queue the producer can likewise see the advanced read index
> and overwrite an entry before the consumer has loaded it: one message
> is lost and the next one is delivered twice.
> 
> vc-sm-cma, the queue's only user, logs the stale read as
> "vc_sm_cma_vchi_rx_ack: received response 1818324333, throw away..."
> (0x6c616d6d, the MMAL header magic of another service's message now at
> the stale address) or as a response of 0. On a Raspberry Pi 4 decoding
> short H.264 clips in a loop through bcm2835-codec, 14 messages were
> lost in 23.5 hours, about 35,500 decoder teardowns. Each lost message
> pins one of the VPU's transmit slots for the rest of the boot, and a
> pinned slot stays charged to the slot quota of every VPU service that
> has a message in it. At 14 pinned slots the VPU stopped sending on its
> MMAL and SMEM services at its next slot boundary. That matches vchiq's
> default per-service quota for 31 slots, 15: 14 pinned plus the one
> being written. From then on every attempt to create ril.video_decode
> failed with -ETIME until the next reboot. Every lost message that was a
> VC_SM_MSG_TYPE_RELEASED also left an imported dma-buf referenced for
> the rest of the boot.
> 
> Store the entry before publishing the index, and load it before freeing
> the entry, with smp_store_release() for each index and
> smp_load_acquire() where the other side reads it. The queue has one
> producer (the slot handler thread, through the service callback) and
> one consumer (the service's own thread), so a release/acquire pair per
> index is all the ordering it needs, as in
> Documentation/core-api/circular-buffers.rst. No lock is required.
> 
> The comparison kernels carried a test-only delay between the two
> statements of vchiq_msg_queue_push(). Even at 0 that hook adds a load
> and a branch between them, which widens the race. With this patch, a
> kernel ran 3,001 decoder teardowns, half with the delay at 0 and half
> at 500 us, without losing a message. Built the same way without the
> patch, it lost hardware decode after about 600 teardowns, twice, with
> the delay at 0.
> 
> The cause was found, and this patch written, with an LLM coding
> assistant (Claude Code), working from the log line above and the
> vchiq and vc-sm-cma sources.
> 
> Fixes: 77b3f6c49105 ("staging: vchiq: Move message queue into struct vchiq_service")
> Signed-off-by: Jussi Alanärä <jussi@firstview.fi>
> ---
> 
> Notes:
>     This is on top of drivers/next, where 0d6409fd70af ("platform/raspberrypi:
>     Add VideoCore shared memory support") adds vc-sm-cma, the first in-tree
>     user of this queue. Its vc_sm_cma_vchi.c pushes from the service callback
>     and holds from its io thread, as the Raspberry Pi tree does. There is no
>     stable tag, because no released kernel has an in-tree caller. The Fixes
>     tag is there for trees that carry vc-sm-cma, the Raspberry Pi tree among
>     them. The vchiu queue that 77b3f6c49105 replaced stored the entry before
>     advancing the index (with no barriers either). That commit moved the
>     increment first.
>     
>     Testing was on a Raspberry Pi 4B, on the Raspberry Pi 6.18 tree
>     (6.18.50), where this file still lives in drivers/staging and the same
>     change applies unchanged. vchiq and vc-sm-cma there were stock. The
>     kernels used the shipped config with no debug options, and every run
>     started from a fresh boot. Each lost message was counted three ways: the
>     "throw away" line, a slot that stayed claimed across two reads of
>     /sys/kernel/debug/vchiq/state, and an orphaned dma-buf. On the long run
>     below the three stayed equal, at 13 each, until the 14th loss.
>     
>       kernel                    teardowns  lost  pinned  hardware decode
>       unpatched + hook at 0           605    12      14  lost at 24 min
>       unpatched + hook at 0           608    14      14  lost at 26 min
>       patched + hook, 0/500 us      3,001     0       0  kept
>     
>     The 23.5-hour soak run used a kernel that also carried unrelated
>     bcm2835-codec fixes. vchiq and vc-sm-cma were byte-identical to stock.
>     It logged the first lost message after about 3.5 hours and the 14th at
>     23.5 hours.
>     
>     Not done:
>      - this change has not been run on mainline or on drivers/next. There
>        it was only built: arm64 defconfig plus BCM2835_VCHIQ,
>        BCM2835_VCHIQ_MMAL and BCM_VC_SM_CMA as modules, CONFIG_WERROR=y,
>        gcc 15.2.0, and vchiq_core.o again with W=1, without warnings. The
>        diff is the tested one with only the path changed.
>      - no long natural-rate run of the patched kernel without the hook.
>        Stock loses roughly 2 to 4 messages per 10,000 teardowns, so showing
>        the patched rate at least ten times lower that way would take about
>        160,000 teardowns.
>     
>     Not addressed here, and happy to send separately: both functions take a
>     service reference through find_service_by_handle() and never drop it,
>     so every message leaks at least two references. Also, the vc-sm-cma
>     "throw away..." print has no trailing newline, so the line only reaches
>     the log with the next kernel message, sometimes minutes later.
>     
>     On tool use (Documentation/process/generated-content.rst): the analysis,
>     this patch, its changelog and the test tooling (the delay hook and the
>     counters above) were produced by Claude Code, an LLM coding assistant,
>     in several sessions under my direction. In short, the prompts were:
>     explain this log line from a soak test, fix it, and prove the fix on the
>     bench. The same assistant ran the hardware tests on a Raspberry Pi 4
>     through our lab tooling, and did the build above. I have reviewed the
>     analysis and the patch and can answer for them.

I don't believe that.

>  .../raspberrypi/vchiq-interface/vchiq_core.c  | 27 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
> index 48d6b1d74329..a5cd7e2a9dd8 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
> @@ -2654,15 +2654,26 @@ void vchiq_msg_queue_push(struct vchiq_instance *instance, unsigned int handle,
>  	if (!service)
>  		return;
>  
> -	while (service->msg_queue_write == service->msg_queue_read +
> -		VCHIQ_MAX_SLOTS) {
> +	/*
> +	 * msg_queue is a single-producer, single-consumer ring: this function
> +	 * runs in the slot handler thread (the service callback), and
> +	 * vchiq_msg_hold() in the service's own thread. Each index has one
> +	 * writer, which publishes it with a release; the other side reads it
> +	 * with an acquire. This acquire pairs with the release of
> +	 * msg_queue_read in vchiq_msg_hold(): an entry the consumer has
> +	 * freed has also been read, so it can be overwritten.
> +	 */
> +	while (smp_load_acquire(&service->msg_queue_read) + VCHIQ_MAX_SLOTS ==
> +	       service->msg_queue_write) {
>  		if (wait_for_completion_interruptible(&service->msg_queue_pop))
>  			flush_signals(current);
>  	}
>  
>  	pos = service->msg_queue_write & (VCHIQ_MAX_SLOTS - 1);
> -	service->msg_queue_write++;
>  	service->msg_queue[pos] = header;
> +	/* Publish the entry only once it is stored. */
> +	smp_store_release(&service->msg_queue_write,
> +			  service->msg_queue_write + 1);
>  
>  	complete(&service->msg_queue_push);
>  }
> @@ -2677,17 +2688,21 @@ struct vchiq_header *vchiq_msg_hold(struct vchiq_instance *instance, unsigned in
>  	if (!service)
>  		return NULL;
>  
> -	if (service->msg_queue_write == service->msg_queue_read)
> +	/* Pairs with the release of msg_queue_write in vchiq_msg_queue_push(). */
> +	if (smp_load_acquire(&service->msg_queue_write) == service->msg_queue_read)
>  		return NULL;
>  
> -	while (service->msg_queue_write == service->msg_queue_read) {
> +	/* The same pairing, while waiting for an entry. */
> +	while (smp_load_acquire(&service->msg_queue_write) == service->msg_queue_read) {
>  		if (wait_for_completion_interruptible(&service->msg_queue_push))
>  			flush_signals(current);
>  	}
>  
>  	pos = service->msg_queue_read & (VCHIQ_MAX_SLOTS - 1);
> -	service->msg_queue_read++;
>  	header = service->msg_queue[pos];
> +	/* Free the entry only once it is read. */
> +	smp_store_release(&service->msg_queue_read,
> +			  service->msg_queue_read + 1);
>  
>  	complete(&service->msg_queue_pop);
>  
> 
> base-commit: 0cab822bca7a59667774725b83e948b71462290f

-- 
Regards,

Laurent Pinchart
