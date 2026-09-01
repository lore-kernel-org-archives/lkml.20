Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3291846AEFC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248435; cv=none; b=SXG0UzC0IV/8Z9TNn8N7Ex6ZDr3Z6qwCQXv6WqMCwIVUmOwAoJ7O2w/D6Bsx9xk3TImhgyW5oMTsqG4h6jJEADzw1BKcHw4PuuNRHX9Qd03sW0HJdv0UWd7JNFc2AkMBkaUYx57cHXJfVzHZG5XIRBaEmRGztFFO8deDI7N4i4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248435; c=relaxed/simple;
	bh=SnScvYQ58kRKYB+tmirN+8KYWnfVkeT0kp9uU8rVR6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O89jERr73RI+19zofmIFlnlOEVsWgyfSdBMIc3O7nknMPXdcWrIxYdCCu2G1yPI7touHoUL/71zWskoI1TlggSZGqx+PeFt/A4wFJxrA1HsIh1AbsIuNT00Ua1Vx4Szgl7f7bRZ5JJWlmbf/6WXszN+2mzLEqeourboW+d9pS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bpYvVZ56; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bpYvVZ56"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4843e397f74so621252f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788248432; x=1788853232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HF4U4AVbFyRnHRkTPHJ1++rNvZtxIzpO7sl9hMNx7/k=;
        b=bpYvVZ56vEf6zmFFQabmVmH+UAqsSIIqxpepeaFNmrbpTI/GpsvWaiDyIK+oYys1yd
         bGvLKMHDgcOlln8RzOYd4wmeJg/xpO0h6jXcSgbPnpJkAgn+kK1+2Yfge46ZPv0/2VCs
         rNxh0T+XaxBC5T8AtYRsX9MJ+Sz/DlAP0gobNwD8xzFrVnTNAQSBGA2IEPUkfHw9LZ1H
         r9QS14s7UtVJcXvHamqBunawwgErt4L26vA2pz1H/bf1244SG2oUsOst5dFiYdi34Nwl
         mcGkZ2dUXtWSMkhN4C5Y63JmeKxUbR+Ly3BHu/9m/Kaz/QMwzZ7QxzN6QChECXTGk4yD
         cMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248432; x=1788853232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HF4U4AVbFyRnHRkTPHJ1++rNvZtxIzpO7sl9hMNx7/k=;
        b=T5v/KQICBsvufPmlWaZRuDIIz/FMrPIW6KL2nn/FlGQbnF1IjSvapv8ljiDmVah/ZT
         DGUP3mb7dj9SDO4ErjwDmhe9gaK5Scm7PnY2VqJEW+QVPzQKq+x3vL0AGZbC8HcuQAlj
         mr5y/zqlHhMV+RhQjQmmrV/wjP6PEPYiV2J0HeNXw3nOCQlK5wkFM9Z5LHInmfjwjPAY
         d4c2Bt1WvlKybD+W520Vv80wpg4uzDTAeg/IMPTJuKPfHx27gzRRsaiPaGjopWvuBZP3
         C2acTwQ65HF44murbwJebv/Si4Fl8/VKG9OHyjWaWlgq7s38cVYmwklTR2eV2XXlopQ+
         QDdw==
X-Forwarded-Encrypted: i=1; AKwUvBxi0VCUxCdZ1SiUANlCblrUuKkWJb7LIAJqdCZLDN7ow8+86Iap+uLVDUNRcmIIeu+9rXgeX0H7CRfpuvU=@vger.kernel.org
X-Gm-Message-State: AFuF++m3RO8wansL95tWEvvssBj9m70m94NF2+PK05zDI+GI4OO3QXZu
	PH5FhZmvjqMmtR46owmo6KlDmxg3HRv7PuHd9uGDDFEtceBUEqRZDwsnCDqhx8FesRk=
X-Gm-Gg: AYBFou3TjtRtTtBhSmt71pQQuw8cTwPO5cdtBAz3UWO/iasZqFyTvG8H19a+N2kLjeT
	aM+SN3gC4fR+cVQokJjNRp7Hh88g9zMA4TUrII5jyPSbnAwvPH4IvqgTJmDAOswFeWFy9+QMkqy
	JKeUbRmrlxU4do9lIUv6HQg80cHUdZGjhmwvwllPXV6FUziR+rqPNFF0MLTnhVVVSmNuOOwUkhM
	ImO2TrplYmq9V636jn7LW5w8k42RXYrYFH0iWwlbfK1aJosWAap5UxIQANxTbqv0SgyuH7W/vti
	of4xM5oyrq9uTGJX1gjeOXXGg0qY4/RCjvuDLHlNrLYfaIxlN/qe+PflMJEDgT1hm2wkRqWyOzO
	LRzvwSQNJpHinv0x3di6m/iAl6Mbagc8u0HM6dz97S9qbcdPa3OPWCsbjerS3VXDZGtNXvDxETl
	31kY1GXrsNyHRxRNPazeyktIdwFDeAEFSQ3DTbEo8T1mqUYwgzyBpZor1DLz926lGBhtri3uM4b
	g==
X-Received: by 2002:a05:6000:654:b0:482:f270:6a59 with SMTP id ffacd0b85a97d-48441fc0e68mr5155370f8f.1.1788248432302;
        Tue, 01 Sep 2026 00:40:32 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7e34csm2984329f8f.33.2026.09.01.00.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:40:31 -0700 (PDT)
Date: Tue, 1 Sep 2026 09:40:29 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v2 1/2] printk/nbcon: Flush nbcon_irq_work in
 nbcon_free()
Message-ID: <apaBbVmBClxIqCdE@pathway.suse.cz>
References: <20260828140218.232439-1-john.ogness@linutronix.de>
 <20260828140218.232439-2-john.ogness@linutronix.de>
 <apWXS74ckfSIrH5m@pathway.suse.cz>
 <87se3upbrk.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se3upbrk.fsf@jogness.linutronix.de>

On Mon 2026-08-31 17:15:35, John Ogness wrote:
> On 2026-08-31, Petr Mladek <pmladek@suse.com> wrote:
> >> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> >> index a5921a84a80ed..218b1922a58de 100644
> >> --- a/kernel/printk/nbcon.c
> >> +++ b/kernel/printk/nbcon.c
> >> @@ -1849,6 +1849,8 @@ void nbcon_free(struct console *con)
> >>  			printk_kthreads_running = false;
> >>  	}
> >>  
> >> +	irq_work_sync(&con->irq_work);
> >
> > The irq_work work tries to wake up the printk kthread which
> > has been destroyed above. 
> 
> Note that the irq_work only wakes up con->rcuwait waiters. Since the
> kthread has already ended, it certainly is not waiting and there is no
> wakeup.

Yes, but this is an implementation detail.

> The irq_work_sync() call is literally just to clear out the irq_work
> queue, not to actually wake anything.

I still believe that this should rather be done before the kthread
is destroyed. IMHO, it would be more logical there. Or is there any
reason why you would prefer to flush it later?

I am sorry for being so stubborn. It is not a big deal.
The current ordering just looks suspicious and weird.
I could live with it. This is my last attempt to convince you ;-)

Best Regards,
Petr
