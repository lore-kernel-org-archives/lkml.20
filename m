Received: from mail-108-mta124.mxroute.com (mail-108-mta124.mxroute.com [136.175.108.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D83F20ED
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117337; cv=none; b=OaOv6bPwdTTQNsoeLZu8vV1XmC30HdY4eOO/da20/B+8lChQcduBaYoQqLRBiPH9IR4x34W6+YBymkaBhL60u0yInrBqDxO5JMF97DK7bncw5sqkc1HT4xhs+Bcvc2RJ1G7izxTwZoBTpKQ4Lxk6SxxBvB2/ys80EXwoVnctOKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117337; c=relaxed/simple;
	bh=VYWVkuhK8loGJySTw2WsMZWWJ172J0KKe7qo2FVcwtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXT3mv2uWQwhFV4ERpBIpoQaWAl7ye7gSzgZC6PjhJkxnhFbk0wJPA2lEvbp3DqpUQLIg7BKN9Y1nCd0M6KrYNk/+LOrT7K0HPQ6bfFqq4ogpSB8KN5006dJCJp8HWswYO9uEAlOyaNNEtJcPOIdirs+FEoQbdEkFcUCOnRiDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev; spf=pass smtp.mailfrom=wii.dev; dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b=WYD5/4RK; arc=none smtp.client-ip=136.175.108.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wii.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wii.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wii.dev header.i=@wii.dev header.b="WYD5/4RK"
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta124.mxroute.com (ZoneMTA) with ESMTPSA id 1a106e4d3b400028b2.007
 for <linux-kernel@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 04 Oct 2026 12:30:22 +0000
X-Zone-Loop: 8ef526520bd055a2b7f8a702e3e8bead8f0588a11d53
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wii.dev;
	s=x; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc
	:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jmxcAD576CyPX+VZWjnCAVGQShC2cwwIF2/zkpeGdys=; b=WYD5/4RK8KMwe+bzq80RQaj6Lf
	o3sXcEGuCLOvNUtxrKWmCW0kMBv2NckI35CZ1FVuCbuKKUpB7vEIlTCuItD1QIcFfiq5/AsY8SfhB
	iRgpV43yE87MIDHyePDw+V7dDNWZI4h+yi0wuNEYnWbg9LcnAMG5LNgsoQesey2dyqdM8RkalVdSY
	W6PEOFjR3OsDiQ1dWXTYaGm0ysJ+/T2CDUjy6WfSJe5/C3xnUJQ3I2rTglMd0TsEvDB48KtPrev87
	4Vm8CkrpVXhTgCMIkNytwH0XIUTGvy7+ru4rzlC9yHKm8DQYsh5nX2eszoQMrCweYC5YqOR+1b0x2
	CkhMNgRA==;
Date: Sun, 4 Oct 2026 12:29:58 +0000
From: Richard Patel <ripatel@wii.dev>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <asJGxhij4OzWNYn9@wii.dev>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
X-Authenticated-Id: ripatel@wii.dev

On Fri, Sep 25, 2026 at 04:42:16PM +0100, Charles Keepax wrote:
> Currently the auxiliary device for the link disables IRQs before it
> calls sdw_bus_master_delete(). This has the side effect that none
> of the devices on the link can access their own registers whilst
> their remove functions run, because the IRQs are required for bus
> transactions to function.
> 
> There appear to be two things that currently block leaving the
> IRQs enabled during peripheral removal. Firstly, the IRQ handler
> iterates through a linked list of all the links, once a link is
> removed the memory pointed at by this linked list is freed, but
> not removed from the linked_list. Secondly, the potential that
> an IRQ runs after the controller itself has been destroyed.
> 
> For the first problem add a list_del() for the linked list item,
> note whilst the list itself is contained in the intel_init portion
> of the code, the list remove needs to be attached to the auxiliary
> device for the link, since that owns the memory that the list points
> at. Locking is also required to ensure the IRQ handler runs either
> before or after any additions/removals from the list. A new lock is
> added for this, the shim_lock is used to gate access to the shared
> registers so doesn't feel a super obvious fit for managing the list.
> 
> For the second problem utilise the newly added helper that allows
> destroying the peripherals separately, allowing the auxiliary device
> to disable IRQs before running its own cleanup.

I ran into a use-after-free on Samsung Galaxy Book6 (Panther Lake)
the other day.  I was going to send a patch adding RCU, then I saw
your patch already added a mutex:

  sof-audio-pci-intel-ptl 0000:00:1f.3: SOF firmware and/or topology file not found.
  Oops: general protection fault, kernel NULL pointer dereference 0x3c0: 0000 [#1] SMP NOPTI
  RIP: 0010:sdw_cdns_irq+0x9/0x1f0 [soundwire_cadence]
  Call Trace:
   sdw_intel_thread+0x2d/0x50 [soundwire_intel]
   hda_dsp_interrupt_thread+0x97/0x320 [snd_sof_intel_hda_generic]
   irq_thread_fn+0x23/0x60
   irq_thread+0xc7/0x190

I would add 'Fixes: 4a98a6b2fa75 ("soundwire: intel/cadence: merge Soundwire interrupt handlers/threads")' maybe

> @@ -145,8 +155,10 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
>  	struct sdw_intel_ctx *ctx = dev_id;
>  	struct sdw_intel_link_res *link;
>  
> +	mutex_lock(&ctx->link_lock);
>  	list_for_each_entry(link, &ctx->link_list, list)
>  		sdw_cdns_irq(irq, link->cdns);
> +	mutex_unlock(&ctx->link_lock);
>  
>  	return IRQ_HANDLED;
>  }

I don't understand the code very well, but isn't there a second UAF
with the ctx object getting freed?  kfree(ctx) in sdw_intel_exit()
runs well before the IRQ is unregistered.

  -- Richard
