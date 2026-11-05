Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875064;
	b=xTYBVFqOTs3D/+2W0aPeZ1OIUy7bWR2xW5LhpVv098QdcI2exgFvmEoXbDqKjacig2zg
	 yflSRY4gQKND9TyV6T30CSfsiDWq147W/yDK1dcun/tLWDpr1quGpbhVO/Xa7p1ZNnw84
	 uFxQLe0sCHoH09qKzIgIRN5b/7DZjHCqZo2nlPB0gcMONmS0dagtArT63k3dqegkDLYjf
	 l0QwlPQtdeTEz2QaTNqGP35RjtXDjE4jgxWeQ3KJtX0U/8IVSjAcEwQJtdlw6yWXu9n+X
	 hVdlkYx4l4L+X8ZW30U49xnjESQveerM0HkLgpEQD6x8jEQIMspfMAKCx9iPmOnQIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iMozJrqsbJNaYrQWQl7LXiR3L3jpnB4n+AT37MLrLIc=;
	b=o/BOtzluy/JOLDs8mQbWnUw4bZ52f9vG7Hg+CabrAVp4wJ8IA5eR2hN5C82MtcwINVwG
	 Nl35jlmLG65qUXPPqsZFpgjM2HnhSwPLH9JBcAgXD4izpvnI4t/w/utwhZYFnWC3rWxss
	 ghVi6Jb3QISSIjLJAQ4F70fVEQduGxm3d0AYa95lNR/XNAEUefN7amMreL2AEev0grYc6
	 TkE7Fw40OR45OKRRb3Iq13By7eNfjmOH0p0KTv1mRKHFVH3n8juXMn5V4Qg67SgEqD+Ja
	 uzwE/8LXkgtcyIiqbFM4oxLxnp1pr1jvHg5J/9s7YbFtFkn5m8B3QsuwOQ6v/EFYEPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="eCrLt/kn";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07C9606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B07C9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eCrLt/kn
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso815200f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793875062; x=1794479862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMozJrqsbJNaYrQWQl7LXiR3L3jpnB4n+AT37MLrLIc=;
        b=eCrLt/kntCWnUUNfiv9bUfAm+A88uOltZ1w6tss4vTBJcS/hskO6e/QIOmRTqChifH
         mRGyZp2ZyfcInYuXz4dyUcDpOficKP+3E9gjZp2hVYA64ExBcr0a/dbN92KqMUHOdggO
         btAF0n8KiaxK/6i/WOj9eqBeSoHCC/6zlSrCUhYklYPi0cM5g0kepecf+bUY7nXS3tf9
         aqpIZbiT99h/CNOnY3efy5s24pjVWk96loP79KQXJdoMESNJpGso68odyz/1FXneTPBq
         5nEKGGWz6SF8N9rEv40vUxEikpbb4gAFFgMEC9Jld0nv1BdVBf47XqAffI+MSGenLgJF
         V6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875062; x=1794479862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMozJrqsbJNaYrQWQl7LXiR3L3jpnB4n+AT37MLrLIc=;
        b=G3H6OF9JwpbcC77g/fF+MDK7U5WGkHFpncgGoVtfYvzZImZobW4/GEZVGIMCVbLRZN
         dQaI6aS+I6CaCffo8lVbNZVCexKWcTrd/g0+o4GSHaWGndlxwK7ZN+y1Ll0tbNSda00+
         LWtYCJ9//9ALSz0JOz8VmwulhL3UFyozdpyetEo7vweXwTISb2lAWnNrshjc4Qwvf5tx
         6VoLdFg1LlDAbpal6lyEWwLuwkH4sCWnv7Cmif67ws4TDVgNAelKOrTLvyl2zlWhsrCV
         W5Gpu2b82ba+EMZm23Sj2pfzToXb9P0b/F8CIGsHsHFwmJGVxyp7rD2rTMEN7e904MUc
         qvyA==
X-Forwarded-Encrypted: i=1; AKwUvBxtUEBbTHX2mytomrq/2gkEvDIubEn7Q5+wdsMX8P5DP8HG/zYCcI/guVKoblQbGhHPBE5mYx2VupP6SEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dA3/HEiAJ0r1YR48M/4VlgiBtuS0Rh8Y/fRg2aS7iyluVLIr2
	M6t3HWNi/MfURMizeXP3Uu/SuWV0O60jlHPyyRfYgsZwfbNpRm2C9Gt4XWbY9249Pqk8Z7jcfA6
	dtCUvg1Q=
X-Gm-Gg: AYBFou1JdwRKLWV03o2gGdSnL2Dxw6uZQ/QyqM3IvkYkAaXXOOcKAprMPegAyb78KKm
	PbFquu2Jg2sImNh8MwCed2Q/3rU/zXyQtrWM1PV4BCLLFeEeEGBVPefc18AOnwPo9XSP9nJXT9a
	tyu2u2HJLN/V4hrNXJbDZVCD/RwKnDrAqFnsaEOMZkMw4olWI36UBYtE7gACyDCHO91jvm4AVRg
	kAEsDNe8fRuZS6vf1slA5G3zu8JCV0OE3xaFBtP0GfSLRbMgzTtBcLa/oA9FD7St7e+KIyi4dne
	QjzMXN/4k0t9AvLpyuffyQ5IZqFz25ux5nGpMwFcKu4IdPn9FpUCISXrgaiP0IkoAnx3Lsri9cD
	W41RWgM0nqR51f9eFPFZ5241UUUdA998BSHdM6ls6iPc9pb0S8sNjqpw7nhX+2eLzOQLDLsvliH
	4vrpQja56bItlpRg+jWTP4JeeFi5Bx8WYvwv2gL2Hi1bJf56affM7Pq+O5qFzTW7fpeWo1MhQEl
	zaobb+/uGVtDiizAwzqaOa/9/LezPYhTbutWmtFEaTu9Ut6o9vYFewS3PMtgX50wnVvnSRcBo2r
	JlXBhu5T93B58xr9PNoFecAgVyn35Q==
X-Received: by 2002:a05:6000:4713:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-491da8f74bcmr1528879f8f.26.1793875061989;
        Thu, 05 Nov 2026 02:37:41 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8734sm9717303f8f.20.2026.11.05.02.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:37:41 -0800 (PST)
Date: Thu, 5 Nov 2026 11:37:39 +0100
From: Petr Mladek <pmladek@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>, kernel-team@meta.com
Subject: Re: [PATCH] serial: amba-pl011: touch the watchdogs in write_atomic()
Message-ID: <auxcc43USXjFxBeI@pathway.suse.cz>
References: <20261104-pl011_touch-v1-1-e292bd834e14@debian.org>
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
In-Reply-To: <20261104-pl011_touch-v1-1-e292bd834e14@debian.org>

On Wed 2026-11-04 02:35:51, Breno Leitao wrote:
> In emergency context, such as WARN(), nbcon prints the pending records
> through write_atomic() with preemption disabled.
> 
> On arm64, WARN()  can run with IRQs masked, so the whole backlog is
> printed with IRQs off as well.
> 
> Commit 9bd18e1262c0 ("printk/nbcon: Restore IRQ in atomic flush after
> each emitted record") does not help here, as it only restores the
> caller's IRQ state between records.
> 
> pl011_console_write_atomic() busy-waits on the UART for every
> character, and at 115200 baud it prints about 11.5KB per second.
> Flushing a few hundred kilobytes outlasts the hard lockup threshold
> (10 seconds by default), so the printing CPU is reported, or the
> machine panics with hardlockup_panic set. See [1].
> 
> The 8250 driver avoids this by calling touch_nmi_watchdog() while it
> polls the transmitter. Do the same in pl011_console_write_atomic(),
> once per record.
> 
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Link: https://lore.kernel.org/all/87wlqtxb14.fsf@jogness.linutronix.de/ [1]
> Signed-off-by: Breno Leitao <leitao@debian.org>

Makes sense:

Reviewed-by: Petr Mladek <pmladek@suse.com>

See a comment below.

> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -41,6 +41,7 @@
>  #include <linux/sizes.h>
>  #include <linux/io.h>
>  #include <linux/acpi.h>
> +#include <linux/nmi.h>
>  
>  #define UART_NR			14
>  
> @@ -2734,6 +2735,9 @@ pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt
>  	struct uart_amba_port *uap = amba_ports[co->index];
>  	unsigned int old_cr = 0;
>  
> +	/* An atomic flush may print a long backlog with IRQs disabled. */
> +	touch_nmi_watchdog();
> +

I would personally touch the watchdog at the end before returning from
the function because it still could spend some non-trivial time
in this function.

But I do not have strong opinion about it. AFAIK, there is no official
recommendation. Some callers do it before and some after the delay.

And it should not make a real-life difference because a single
pl011_console_write_atomic() should not trigger the watchdog report.
The problem is when it is called many times in an atomic context.

So that it probably does not matter after all. It is a matter
of taste...

Feel free to keep it as is.

>  	if (!nbcon_enter_unsafe(wctxt))
>  		return;

Best Regards,
Petr
