Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B8936920C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792209744; cv=none; b=HopFjQfim2uLGybDnB0/ScPmdIh/2MX7Mzh28eU7/kdu+sVN0mbTsFI89Peh+4dzDZY3IemwWSntJMOofXugdHumSmIJT4UeNVNDWW5wpG8g7flGSICpMhoTrkv//5YyX+lvU97jj1g0qj68TcF6nayniH/VWscqw19KF9P3wEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792209744; c=relaxed/simple;
	bh=QY/6va/G/82o28dCVCB9BwtsRCc4nBEpxEIUHB64fiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nr47opYkKw06AS8GdkkgfGKl62iLTtJ2NsVqv1zNHTvqa3c0KVoJQA6FgVjd2Zres0p+j7qzuMupc11q8/dmMC+KFoagWPOL4/PY8/uz4l6cpSlWBEtBxDuqhxZFYbpMJctmf0jWN6T62HRzLfbvMlFx0R77+xpk7F/UU570RIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=QGvppSrB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HWDrbrws; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="QGvppSrB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HWDrbrws"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 74AB0EC0104
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:02:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 17 Oct 2026 00:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1792209740; x=
	1792296140; bh=MtnEyf6IsCDKOHOzluJtK1QkOgHseokvmOqH88Ss6JQ=; b=Q
	GvppSrBoF0YuEwIKIEb76e8Wh9PGLcsGX6Fp7gyi2UsvOZaJR894LnogvSPEM3nD
	2Z0gZ7NQ+QZ4Bxhp8TGpWehpWyTMRlYtBotcNT87hHpYy0B2tK97Gbp5jLnANu9v
	G/OKYBvaNp5hHZB/eJEDZKKOvRLaRWfLnEboVqpIcJ+jkY2RngT5nI9Y4oV2rr5+
	3khPUafIeZBxbJB5NO6Q0mVVACOEyAKgTCKAl1Vfk182JDzNp9D/hvAXlNOOCIYr
	nBcoarVZyVsP+0P1H+Ua8t2DGYEKZYrsCvnSf5Zpsnguh7+RiqjCfhZtf+uDUFU2
	hwB9oNse9Sb61IltBz8ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792209740; x=1792296140; bh=MtnEyf6IsCDKOHOzluJtK1QkOgHseokvmOq
	H88Ss6JQ=; b=HWDrbrwsM0THx3OTdbYKCK7wTl31dx4xNQ+liFFfZD0XsPVKoVl
	7PsIn8MqbEdsxyhbUcAGXSMNb/8X4nxg9XmAWHpdjyTRFG30BVxumkTELkTDFEKr
	Zz5UAkCFsSQ4Pwlfrc6tsuh+09rSMRt+voWT1An2RFGC6/ieMnxNFw1u9hoqzAyj
	HOrkVAcRiqo6Cw+3drf/ZC+nDDvk0frDOgweKlEYby/RyNmqQ+Z4ShqrRnjscuek
	crSFWt0lVmNjuChFY3GQnjSnqznMX2LV2/FI/pGVR88uaZ0NS3EQCDHwFpilZtqb
	w0479t2nGIb33RxGD0xNBj9FIlx9LPPwbRA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792209740; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Fs1Z47i6mcS+kcHKyi4FQHIIcrjOXZuEOzJTwOn+prA96yI
	JwzlhbcdcTXEmFK2Hk7wU5XYnCgZEOgQD2cQLGrksr6e+5KnorM++jt+lpWKw7iK
	6kohvtL0xd/VSmkC0g8/01WbkbDyS83fAWMHMEbEYlvhjVYVgepFWqby1y5nGJ1A
	e5dUin2rlnvMSTBxvhzzHW55lDnuWVHOJfQb33UBqBiXxw/5eHA7osv9ty13UdZf
	5DchTSCAZB84DlO9oCT96uD5flAm82/gosVTQCzVVHnaegp+ls1ybc1MKhQ8vo60
	rkMleA/J5eHVq8Itd09ZPD3cqXi7hiiMzyY1uTA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:m14skotbns9dpqJVPOhE/bbhCliFeIpYG5ElBscawc4=:QY/6va/G/82o28dCVCB9BwtsRCc4nBEpxEIUHB64fiY=;
X-ME-Sender: <xms:TPPSas8dzq0Bt0HHEz_V1vQdSFcQaF9N5eQHZ5ztDOPPrSw7pOGeZw>
    <xme:TPPSair0OFTSZS64Iy83B1HmEcL3AnuI91l4LXGU08-SnEvgC81ZzjU5ovi4c7MGD
    5y0GxwuviOlADjg61xpBMOG2qCCx2Cl0t8ZURDRX6oIX4ZgkhfOhy0>
X-ME-Received: <xmr:TPPSapkvHHSyqsAlyi8Fy7b3_3_C1vSvZ1yMwoKMkuv0rY-rZg5Y7gLnHnC7B7p_W43QjbzLF_tL3vrMFoQi9v33Etwm>
X-ME-Proxy-Cause: dmFkZTF7KSUpLN0kcUnh+FudJoCIQJA7AqU7ZBWm8N352Z9ut9hiYij55kq91ZGCq8Z7XO
    8HQ3p0ZRBPZDgU1zQoGZbeLwA6uMpHBO4uxYjqQmKKglIimLYElg/D0YPiDS8XQtmKE4YJ
    ABVBWjo8zGrFdlK9XFhfJfZ6cdxdaC+USfEM4X4yMiiG8A7ev1W40xQNaLZBinNEyj/e35
    9ZemksokwG7d95zzhDtkVGgUctQlpc0Sj0aNcm7/ETXILweEOuFyM33dTGCb2QMr9HLQHz
    AwxYzPbe1fFrP/5NNiFCrgJCVU6BXXw0xjhBTYZ/yhYS6R5MeRHbfbkY0IwnbsoDP8haIs
    nsoSL/i5zycJfwe5LJLsr7iLGi1y3AdiXgom7/NPBV2pjUSbpNeAAWDoq2u5XgzotawXnc
    zKpYK4RPR5JmoreLOxQ8BVBtJRz83iHjmn0gdjglEHx8oZ6D5vOhFlno/wpVvrMligTo/M
    l/W5mJxdoVfqHBRO8u91RRVzK4d4sQU5xThTkKKKQDEFiJlMlPSqLr+95kE6g2wnZ6BvX+
    yOoo5sPOqI1m5AI7VywYQJR3e+1AnaKvWqUi5NEztO7auHenB5ClIi479tw7LhCxt7vnf0
    8hZrl6f3MO+ZfgFc+ehI1H5sHMN73pr9s2j7O1g9ANCxqq8a2EfjN/0NDa7w
X-ME-Proxy: <xmx:TPPSapKlZ--jVpY-E9A3OYsq-EUuiEjTweNuyteWqlSmDwOxdqKq5A>
    <xmx:TPPSauxdDygya6tuoH00oJpihlduJNm1zql75FRn5PuszqyyLtUUZg>
    <xmx:TPPSahv9Tsxgjk5fFWdDSJ70on-5tEUj_ouTO1L9TJvYMXuA6cYnBQ>
    <xmx:TPPSatsOaugBf_FiDmY1s7gFS19hNoft2PXqv1dmFztOnHJCE25New>
    <xmx:TPPSaiS-POAM8M5WdMMO6fkC6vLWWaRVuUhP9G4cM9_GhcvKzzS3J91i>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Oct 2026 00:02:19 -0400 (EDT)
Date: Sat, 17 Oct 2026 13:02:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firewire: core: invoke packet callback from workqueue
 when removing card instance
Message-ID: <20261017040216.GA145683@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261016135948.85343-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016135948.85343-1-o-takashi@sakamocchi.jp>

I found that some issues are reported by Sashiko.dev[1].

On Fri, Oct 16, 2026 at 10:59:48PM +0900, Takashi Sakamoto wrote:
> Current implementation switches the underlying driver of a card instance
> to the dummy driver in the kernel stack when removing the card. The dummy
> driver simply invokes callbacks when sending request and response
> packets.
> 
> Recent changes for the 1394 OHCI driver and core transaction layer ensure
> that callbacks are invoked in process context from a workqueue. This
> guarantees a consistent execution context for callbacks. However, card
> removel is currently an exception.
> 
> Invoke packet callbacks from a workqueue during card removal.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-card.c | 57 +++++++++++++++++++++++++++++++-----
>  1 file changed, 49 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
> index be6f18d67ece..a26b5e380c6c 100644
> --- a/drivers/firewire/core-card.c
> +++ b/drivers/firewire/core-card.c
> @@ -688,6 +688,15 @@ EXPORT_SYMBOL(fw_card_add);
>   * .set_config_rom() is never called since the card is taken out of card_list
>   * before switching to the dummy driver.
>   */
> +struct fw_card_driver_closer {
> +	struct fw_card_driver driver;
> +
> +	// For closing operations.
> +	struct fw_card *card;
> +	struct list_head packet_list;
> +	spinlock_t packet_list_lock;
> +	struct work_struct work;
> +};
>  
>  static int dummy_read_phy_reg(struct fw_card *card, int address)
>  {
> @@ -700,14 +709,39 @@ static int dummy_update_phy_reg(struct fw_card *card, int address,
>  	return -ENODEV;
>  }
>  
> +static void dummy_packet_callback_work(struct work_struct *work)
> +{
> +	struct fw_card_driver_closer *closer = container_of(work, typeof(*closer), work);
> +	struct fw_packet *p;
> +
> +	spin_lock(&closer->packet_list_lock);
> +	while ((p = list_first_entry_or_null(&closer->packet_list, typeof(*p), link_for_local))) {
> +		list_del(&p->link_for_local);
> +		spin_unlock(&closer->packet_list_lock);
> +
> +		p->callback(p, closer->card, RCODE_CANCELLED);
> +
> +		spin_lock(&closer->packet_list_lock);
> +	}
> +	spin_unlock(&closer->packet_list_lock);
> +}

They should be 'spinlock_irqsave' since the packet_list_lock is acquired
by dummy_send_request(), which can run in interrupt context.

Additionally, an issue has been reported that the packet cancelling and
the transaction cancelling by fw_cancel_pending_transactions() would conflict, since
the fw_packet structure is the part of the fw_transaction structure.

>  static void dummy_send_request(struct fw_card *card, struct fw_packet *packet)
>  {
> -	packet->callback(packet, card, RCODE_CANCELLED);
> +	struct fw_card_driver_closer *closer = container_of(card->driver, typeof(*closer), driver);
> +
> +	scoped_guard(spinlock_irqsave, &closer->packet_list_lock)
> +		list_add_tail(&packet->link_for_local, &closer->packet_list);
> +	queue_work(card->async_wq, &closer->work);
>  }
>  
>  static void dummy_send_response(struct fw_card *card, struct fw_packet *packet)
>  {
> -	packet->callback(packet, card, RCODE_CANCELLED);
> +	struct fw_card_driver_closer *closer = container_of(card->driver, typeof(*closer), driver);
> +
> +	scoped_guard(spinlock_irqsave, &closer->packet_list_lock)
> +		list_add_tail(&packet->link_for_local, &closer->packet_list);
> +	queue_work(card->async_wq, &closer->work);
>  }
>  
>  static int dummy_cancel_packet(struct fw_card *card, struct fw_packet *packet)
> @@ -789,7 +823,7 @@ EXPORT_SYMBOL_GPL(fw_card_release);
>  
>  void fw_core_remove_card(struct fw_card *card)
>  {
> -	struct fw_card_driver dummy_driver = dummy_driver_template;
> +	struct fw_card_driver_closer closer;
>  
>  	might_sleep();
>  
> @@ -800,11 +834,17 @@ void fw_core_remove_card(struct fw_card *card)
>  	scoped_guard(mutex, &card_mutex)
>  		list_del_init(&card->link);
>  
> -	/* Switch off most of the card driver interface. */
> -	dummy_driver.free_iso_context	= card->driver->free_iso_context;
> -	dummy_driver.stop_iso		= card->driver->stop_iso;
> -	dummy_driver.disable		= card->driver->disable;
> -	card->driver = &dummy_driver;
> +	closer.card = card;
> +	INIT_LIST_HEAD(&closer.packet_list);
> +	spin_lock_init(&closer.packet_list_lock);
> +	INIT_WORK(&closer.work, dummy_packet_callback_work);
> +
> +	// Switch off most of the card driver interface.
> +	closer.driver = dummy_driver_template;
> +	closer.driver.free_iso_context	= card->driver->free_iso_context;
> +	closer.driver.stop_iso = card->driver->stop_iso;
> +	closer.driver.disable = card->driver->disable;
> +	card->driver = &closer.driver;

There is a concern about the reordering. When the assigned pointer
value of card->driver is visible in any processor core, there is no
guarantee that the content of fw_card_driver_closer structure is filled
as expected.

Here any memory barrier is required. It is a potential problem that
the original code has.

>  	drain_workqueue(card->isoc_wq);
>  	drain_workqueue(card->async_wq);
> @@ -821,6 +861,7 @@ void fw_core_remove_card(struct fw_card *card)
>  	destroy_workqueue(card->isoc_wq);
>  	destroy_workqueue(card->async_wq);
>  
> +	WARN_ON(!list_empty(&closer.packet_list));
>  	WARN_ON(!list_empty(&card->transactions.list));
>  }
>  EXPORT_SYMBOL(fw_core_remove_card);

Although we are nearing the end of the current release cycle, let me put
in some more work on them.


[1] https://sashiko.dev/#/patchset/20261016135948.85343-1-o-takashi%40sakamocchi.jp


Regards

Takashi Sakamoto
