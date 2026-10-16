Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690DD54DAF0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170636; cv=none; b=TaehSWfxGoLfg15pKASddCyovv+zwsJO+isCUVLehQxl2Pq4LKAzeTmISQ5ZS57u5Pq1OHe9sibeAwqzrLIht6IrSyLArOQAT1tif/6NmnVcpkty66965+auxErw3WiQA1ul/yrvyF6o8v4h1LRP0e/AUHCo6nVw/3PpAomGZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170636; c=relaxed/simple;
	bh=qqXTAdeZbBsPkw1F+XKuuQZIsV/pe6kHZ7RsKZglruM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKiGHzEYqPu6ISoZpp46F9ucwE7G9sqX2vu4lx2H1cBxB1hJIyQSKvmtgx29nzHphVuu4moXQN5tvE2Lb0LdgBDStz8gyfHQ9Yb2U0dgsh6inErM454UoG8iRyf0459Yn3zn3NkzmjMQYa4wUZ7F8Q5Q8jc+o9Mvi6xbfrkmUuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FgDsF/D5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jBw2PMJz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FgDsF/D5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jBw2PMJz"
Date: Fri, 16 Oct 2026 19:10:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792170630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xCT6orX277V/eXrgGHXRg277x8AusfyPsqCSasnsFic=;
	b=FgDsF/D5Edeyu2Mo0sHNinfcY38reKu9+5gIxKRxJnaXTDW1+G+diQgxfT9prblrVYGcDW
	1t92YvUYk8vfEBGJ1+Jei5BonJZ0GBBFoWEZAFdbW4BhvusA1X7riVY7mzVnl6+tzUZ7ev
	sBGj+5RpAGPOhizB40jp9gvF1hgPG5nYc/lldkkLrhiJKJDhgS/iiwVgCQ0ZbRKRxduSKs
	ftKWOu07I+6hArLCi3hBG9vHOanv1bqqKibky1FpDos1GisURUJS+X1QIhRlARns4eSiEx
	RvCjJE1KilOr1hX2AtiyONBqvey6YSTFgnhBcEunV0JtGEe/dbl3VDZiVKZwqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792170630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xCT6orX277V/eXrgGHXRg277x8AusfyPsqCSasnsFic=;
	b=jBw2PMJzPZmXpNqNVTH/hpYeoIqJ86JtMYBJn0cK+Gw+QTUJK7WBCFizx/58pyPVJnI8Lm
	z3dPFRl9cT+Mw+AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: tanmay.shah@amd.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Harini T <harini.t@amd.com>,
	Saeed Nowshadi <saeed.nowshadi@amd.com>
Subject: Re: [Q] zynqmp-ipi-mailbox and SGI interrupts
Message-ID: <20261016171029.wSftndCb@linutronix.de>
References: <20261015083937.8SDbdK8P@linutronix.de>
 <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
 <20261016162356.m2X9jbCa@linutronix.de>
 <4c9b533f-251a-4569-bc78-fd7af664c831@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c9b533f-251a-4569-bc78-fd7af664c831@amd.com>

On 2026-10-16 11:44:07 [-0500], Shah, Tanmay wrote:
> > And it has to be a per-CPU interrupt? It can't become a regular
> > interrupt which is not per-CPU? Does the driver at some point access
> > per-CPU registers?
> > 
> 
> As per my understanding, it has to be a per-CPU interrupt.

I see.

> Driver access those registers via percpu APIs, for example:
> xlnx_mbox_cpuhp_start() uses enable_percpu_irq(). It is called for each CPU.

Yes I know that part but this is not the question.

I meant _why_ the interrupt has to be per-CPU. I'm not sure if this is
internal wired as such or just configured.

For instance a timer is using a per-CPU interrupt. While the timer is
programmed for the next expiry it uses per-CPU registers. So the timer
accessed from CPU0 is different than the one accessed from CPU1. Once
the interrupt fires, the processing that follows is different on both
CPUs.

Looking through zynqmp_sgi_interrupt() which just invokes
zynqmp_ipi_interrupt() I don't see the difference. The OP-TEE firmware
is invoked at least the bits I saw, it just masks the source and moves
on. So I am not sure what is the difference between the interrupt on
CPU0 vs CPU1. Both could fire at the same time and handle the same
request unless the firmware returns a different
IPI_MB_STATUS_RECV_PENDING bit. I don't see how the remote side would
make a difference between those two CPUs.

So this is what I am wondering about. Based on your response so far this
has to be that way.

> >> Thank you,
> >> Tanmay

Sebastian
