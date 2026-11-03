Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712694;
	b=hyPF/oz2NQQGoY57jShxkvb6ck7FoPHV967xLoRnrYLzWr7L1UUa8qIsgioP0fszUSWv
	 pJnAznRi65hCYJBPbn6zuqsu4cXBx8+PNrSKZhGO3zqAa6fL+/NcYgkxKB6XYbwhH5N/c
	 co3W/WyyYVglKCPCcVV/63TSq21PUXTVjRdFVruH9y16o2XTLYo4RLDWILxjF++1BFk+I
	 j7GIkBNovElZL6QBDLe2RG1muKl5YAtLiVkZ26rx77TQ6VKCokYiSIXhUbmoMZpj1RVAi
	 A6RDvwxY+sNcTlzmhiJX14O9K+AeL+yJhyoqwp7uq+Jd2DEODlBXUzkYB1JmCLlJnOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pvj7a22LyPR4DHO/5fDttm0BqOMPgQ0WH59556KkGjU=;
	b=1kueRIIg7NBCPSibfPu2zrIczfYLhZ/U4Xf7CHeU+cbfJ+jKTMe8HCdy8U7w9xhf6zox
	 U+UNbgjUFwWPZU/IMKYPOyAvJmIJSWLMmXCW6R3LAF4eNM5B2m3F5UZnp8K+RDoORDCw9
	 XWrY/e3fhp7iG1ryeWJjV2eml4FRm2BiTfxhvkz7uwqiDGWmYYGauSVmi6RWfzstXwXaX
	 jJeSlIS41/DRk+U1haFIA0oIB4i/5m/7jiQU9A8/7EdfiGxVZjONxhXyKUrDNmRpFUs9k
	 Bjmlsb8ZmWbq8Ye/vrGos7u1/HodAPc9sAmGThDqdZM9DPpAdeQvfeYLBfbxk4eoOzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FkUMtH69;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7B606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E7B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FkUMtH69
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so449802f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793712693; x=1794317493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pvj7a22LyPR4DHO/5fDttm0BqOMPgQ0WH59556KkGjU=;
        b=FkUMtH69okscjkQeoz0Sdj7admXmSG7WNEB2IkeSteQZ57j8AhtKOFbLM80YqT2k7V
         P29YDAhuA0+oDXoNZOMxmX3FMiF3NElVEiwFarWiQ7RwSiwXJtrpIbE4HelWO4DUSX6z
         YP9L4zTSgZ2acdeAIcSf/6kTt5TRFpVJ+g8SCBjv71YbfWfUzr+SkoIkGTrOldc/TNao
         lKx1fqoIyCJR+xaA7BDM7XDuA5gbcCWSzn+YRZIGcHLqSKG3QfngtKWhHd0bSp5x3eY8
         QJ1qnDzN3bi4/PbI/kAovSlOP2BWRNydpfw3LhDV+U3rHb1fEBIoA9aGY7AMFK1gI89V
         wnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712693; x=1794317493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvj7a22LyPR4DHO/5fDttm0BqOMPgQ0WH59556KkGjU=;
        b=jFqKjYQLI1OjlWbXxXcrv5Cmzoa1ikvRQuFZGI97RnPL5lREYFuDawJcJndf/VHPXX
         y37wZgeya1/v74LSFsBSITMoDgWQOsYNoiGhT7iqvWp1iaGOAhMoLQ+zHdVjSt+psaz4
         YnlWEYxaY5XYIrTA+iiIZ6/sQdC9gy8Y7cQQq3epghEPsrW8N4p8PRwaUQEFe2CXQXx7
         QDpq5z79a9kPo2BIzAwBPy76M303qZp38eexUqq3hfFZvSXyCzSTN1Bv1YFtjj824Bj5
         APNoSd6nfhMgQmqX2EuPr12mUCssj3iYYAbPEcmT99gF7UkQL5zdXmpvYqscoYVmVOCf
         RQ9A==
X-Forwarded-Encrypted: i=1; AKwUvBw4pxfzRsXUdNh4RYa8D95IHm+6/tv5HIFKx2vdNiYvmUY3xX5PDTH7uig8+mMmy+hGvfmviZYjzM/gF3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gw2dIUBtawzcxzMGYKjCId773V5NMQ6j7HDWOVEpF1rJcNKb3
	TVE1scu2GSuAl2KOoRvqmLgUgC4Z2j9q8PBiYhJYdOLqgprABsEhoX4gnEbuEjVMTls=
X-Gm-Gg: AYBFou10AGGewDFyvQoRntIVuHqYAlwrT/C7Sqc4nchPxRqxqd6BhaN70DKxi2Ax/7q
	K9KE7YCCbzbcT61jK09JRiqN4NAAlYMttW9cHmBL/4Rnvv7MGEamh3TpB0CvYBmPt1Yxge4g74U
	z5L5lGkZM0M/rTrL1ojiOy90ydjjKpvfP1ycQNdjpihKpOLmOBgzRi+dVwRGS5TThEHJg8rLHLn
	qgsjABgTNi6j0R73MwL3DJHuqtoBzS9uEf62xIasEyUgudGRLWs7RttHJpsmuJaJnPHm5gNQWRL
	zq7iRtIknMwewn4Vb5foPZAp/rTUJ+lcrXlsc0UeR6UY/BfEwXf9XB2g2YlXLp7Ah2wMPeHsC2t
	Yqg0P6ThPXN7mXzNdSItyeYKER8C2vrPNVryuyLwILuFX2rLeO5hEZA7j7HnaZSsOL++XBYnQOr
	VmPRdHmyj8phB8FqqY5Xz7gmhzIPNK5jJCMjvwIYta7FgY72OI1T0OuqQWGqHHoIMjGJ79JUrOH
	QXVtmivYJM+ftiwg64ZtVzi39C3RNKS0OLvKxyZq2/btU1vW0BzoV1jb1+/nXD+Qy8meGx9JnXf
	D74pudzvlL2ofi12W2yFSckf/489yQ==
X-Received: by 2002:a5d:69c9:0:b0:48e:55bd:9ce2 with SMTP id ffacd0b85a97d-48e64cc70d2mr27518936f8f.20.1793712692813;
        Tue, 03 Nov 2026 05:31:32 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725a2sm23654581f8f.13.2026.11.03.05.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:31:31 -0800 (PST)
Date: Tue, 3 Nov 2026 14:31:29 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auniMWhvteH8C3E0@pathway.suse.cz>
References: <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de>
 <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de>
 <auNaD8LELWok3LOF@pathway>
 <auTaBZlNbpm3jgvb@gmail.com>
 <auhl3cdwrHt4Vw7U@pathway>
 <87v76e3mcc.fsf@jogness.linutronix.de>
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
In-Reply-To: <87v76e3mcc.fsf@jogness.linutronix.de>

On Mon 2026-11-02 23:28:27, John Ogness wrote:
> On 2026-11-02, Petr Mladek <pmladek@suse.com> wrote:
> > I have a crazy idea and do this:
> >
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -1688,7 +1688,20 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
> >   */
> >  void nbcon_atomic_flush_pending(void)
> >  {
> > -	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> > +	u64 stop_seq = prb_next_reserve_seq(prb);
> > +
> > +	__nbcon_atomic_flush_pending(stop_seq, false);
> > +
> > +	/*
> > +	 * This is a compromise. Otherwise, NBCON consoles would never
> > +	 * have a chance to show messages in the panic paths where
> > +	 * the unsafe flush is not explicitely called.
> > +	 */
> > +	if (panic_on_this_cpu() && oops_in_progress) {
> > +		panic_nbcon_allow_unsafe_takeover = true;
> > +		__nbcon_atomic_flush_pending(stop_seq, true);
> > +		panic_nbcon_allow_unsafe_takeover = false;
> > +	}
> >  }
> >
> > It would allow to flush the messages directly by printk().
> >
> > I know that it would be a step back in the reliability. But showing
> > the messages looks more important to me than a reliable reboot.
> > And we could make it configurable when needed.
> >
> > Also we could add more checks. For example, do the unsafe flush only
> > when "num_online_cpus == 1" or so.
> 
> I can accept this, since legacy-netconsole had these risks anyway. My
> only concern is when we add an interface for the unsafe flushing policy,
> will we continue to have unsafe flushing be the default for netconsole?
> I guess we would need to keep it the same to avoid regressions (just as
> we need to have it on by default now).

Good point. I think that this basically goes down to the question
whether we would later introduce an option:

   --panic-focus-on-debug   or   --panic-focus-on-reboot

The current state is somewhere in the middle. I would say
that:

  + the legacy consoles are more focusing on the debugging side
    because bust_spinlocks() is called early. And
    console_flush_on_panic() is called before emergency_restart().

  + the nbcon console are more focusing on safe reboot because
    nbcon_atomic_flush_unsafe() is called only when followed
    by an infinite diod blinking.


It looked like the nbcon handling was good enough before
we added netconsole with an unsafe write_atomic. And maybe
even before converting the widely used uart 8250 serial
console driver.

People started complaining about missing messages with
the converted netconsole and uart 8250 drivers. The current
nbcon handling looks like a regression to these people.

My take would be to modify the nbcon handling to be more
like the legacy one and focus more on debugging. If anyone
gets concerned by the reboot reliability then we
could add the --panic-focus-on-reboot and make
the reboot more safe in this case.

How does that sound, please?

Best Regards,
Petr
