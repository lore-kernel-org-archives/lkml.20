Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626066;
	b=C+k7stmEtKkfUV3mr8yY8iYWW+3JCYZVAbN3ryaOjgOK8xh9y+aehVrI1xknpHK/5oq+
	 TU48bNf7SDC2aWKEuLwY9ERdUJqiAdF4ge9uK6CyiItL9ejYh4Mnwg8PsVKNQ3KY9f7ve
	 WSesGU6vmwJ+PlX6q5y8SomX7sUwPmy6zfwduaP9MzEja5KGUvJYoDKpAxY6x+EYNbBDk
	 ijbY491ObFqvycTc1cyVvmQl6MkweRPpRkuMUK8PHk6sLp2RtOvqPPe1vO1qvpIEHRb+z
	 Q4vnOSM7plsduFBxHsavl4bZjcty3I9QX40Y6e4ItwUaimFuiwCk7aq3MCCACrOPUTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626066;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=wvVWiiunAwa2weGP20yLht4itak0c9V8lfTyHiaTBJ8=;
	b=tVEjvRJTZzfuJqeg0lxjt5KterDAUJt2w5gyudGETtjyXwf4EFKt/AFp1SG+z+qS/vyF
	 QUXGyvHlt5DOgKulqgSxBmyAVKcI6T62tOWaOCbpgkNIU46Fg2sSXPKOHCspYh6eC0ryY
	 G2ehdLMWGJOIxbPGMs6BWc8lrpd5F5d+yeYP7ThmUwnRjocRWy4xl4++rWyVt9Exgpad7
	 /1XMVjsxjfAXZIYgSB6Dl527pNREMVcA1zPNzE6bUGdl49mSA/3OyJYGenWY3fYTRyBfM
	 UHYVm1K6KaV4B5qAthCSW+9qz78OOJEfkNDVaRGM1S4hrYY0ZSB1xFSwkqhCXCwKjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=p94X7Tnl;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D4606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4D4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=p94X7Tnl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wvVWiiunAwa2weGP20yLht4itak0c9V8lfTyHiaTBJ8=; b=p94X7Tnl+/UNJoFI/irOcpnXUv
	XbXt3BPmzMQTwjE61hJB1H6SpXhxRN8xemQfuTkdE24QxeisrH7HOtaPPS3j5TmE9rAM071rKdPLc
	4gxZCQhonWrqEgD/8i3bbQpYq6gRonqT0USXqGPdbpOBsGa2R95igs4i0PrM9FE9xt0Q891qcx9fN
	j3Z67sYvMlgkUnJ9dULmC+92TbwMlfD5fvOMz6K9FVkIoUW3gZls2Y1BSiK0u2f8jhmbPFNSXDzV7
	KW0xDNXKZOZKJfWRJwKmp7O7zisRtVnC7e+z29kNlNQUhuE+HgZEPzKK7YOeV7aXKOojVRw+4APXu
	G+BShaDQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xNs4X-006Bhv-0d;
	Mon, 02 Nov 2026 13:27:37 +0000
Date: Mon, 2 Nov 2026 05:27:32 -0800
From: Breno Leitao <leitao@debian.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auiO_x_Am8ZmZcmw@gmail.com>
References: <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de>
 <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de>
 <auNaD8LELWok3LOF@pathway>
 <auTaBZlNbpm3jgvb@gmail.com>
 <auhl3cdwrHt4Vw7U@pathway>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auhl3cdwrHt4Vw7U@pathway>
X-Debian-User: leitao

On Mon, Nov 02, 2026 at 11:28:45AM +0100, Petr Mladek wrote:
> >     The call does not go into console_flush_on_panic(), because kgdb_panic()
> >     calls that before the other CPUs are stopped. It does not go after
> >     machine_crash_shutdown() either: on TDX guests tdx_kexec_finish() zaps
> >     the shared PTEs there, and netconsole on a virtio NIC would touch that
> >     memory.
> 
> This is the 1st time I hear about it. Does it mean that netconsole
> should not be called after this point, please?
> 
> I wonder how this worked before the netconsole was converted to
> the NBCON API. I guess that it "worked" because there was neither
> printk() nor any explicit console flush after this point.

Maybe. Kgdb is being removed so, maybe we don't need it:

https://lore.kernel.org/all/20261028122124.GJ2668804@noisy.programming.kicks-ass.net/

> 
> >     A write_atomic() that hangs now keeps the machine from rebooting or from
> >     reaching the crash kernel.
> >     
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> > @@ -140,6 +140,13 @@ void __noclone __crash_kexec(struct pt_regs *regs)
> >  
> >  			crash_setup_regs(&fixed_regs, regs);
> >  			crash_save_vmcoreinfo();
> > +			/*
> > +			 * Flush the unsafe consoles with the other CPUs
> > +			 * stopped, before machine_crash_shutdown() tears
> > +			 * down what they may need.
> > +			 */
> > +			crash_smp_send_stop();
> 
> AFAIK, the crashdump currently shows all CPUs online. And
> the backtrace shows whatever they were doing last.
> 
> Stopping the CPUs earlier would change the existing behavior.
> And we would need to discuss this with crashdump maintainers.
> 
> Well, I know that stopping other CPUs makes it more safe.
> But is it strictly necessary? We did not stop the CPUs
> when the netconsole was handled by the legacy loop.

That is fair, I will keep the old/legacy behavior now.

> > +			nbcon_atomic_unsafe_only_flush();
> >  			machine_crash_shutdown(&fixed_regs);
> >  			crash_cma_clear_pending_dma();
> >  			machine_kexec(kexec_crash_image);
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index 91e48d33b7dbbd..e14b1b60828130 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -723,6 +723,9 @@ void vpanic(const char *fmt, va_list args)
> >  		panic_console_replay)
> >  		console_flush_on_panic(CONSOLE_REPLAY_ALL);
> >  
> > +	/* The other CPUs are stopped, flush the unsafe consoles too.
> > h /tmp/puf_post.sh kerneltest001.31.atn1 6791 atn1a &); (sh
> > /tmp/puf_post.sh kerneltest005.19.atn2 6792 atn2a &)
> 
> The last two lines are some mess ;-)

Damn, sorry, These are my testing hosts I was using to test this patch.

> 
> > /
> > +	nbcon_atomic_unsafe_only_flush();
> 
> This might be too early. Anyway, it is before printing the line:
> 
> 		pr_emerg("Rebooting in %d seconds..\n", panic_timeout);
> 
> I have a crazy idea and do this:
> 
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1688,7 +1688,20 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>   */
>  void nbcon_atomic_flush_pending(void)
>  {
> -	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +	u64 stop_seq = prb_next_reserve_seq(prb);
> +
> +	__nbcon_atomic_flush_pending(stop_seq, false);
> +
> +	/*
> +	 * This is a compromise. Otherwise, NBCON consoles would never
> +	 * have a chance to show messages in the panic paths where
> +	 * the unsafe flush is not explicitely called.
> +	 */
> +	if (panic_on_this_cpu() && oops_in_progress) {
> +		panic_nbcon_allow_unsafe_takeover = true;
> +		__nbcon_atomic_flush_pending(stop_seq, true);
> +		panic_nbcon_allow_unsafe_takeover = false;
> +	}
>  }
> 
> It would allow to flush the messages directly by printk().
> 
> I know that it would be a step back in the reliability. But showing
> the messages looks more important to me than a reliable reboot.

100% agreed. At Meta, we check if kdump is working or not based on these
massages. Given kdump cannot work due to 100 of different issues, this
line is more important than kdump by all changes.

Let me play with your crazy idea and see how it goes.

Thanks for helping here,
--breno
