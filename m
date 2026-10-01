Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493F14A68BF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856100; cv=none; b=HUUTE8RA5//z8HLs/05JXuNOcYXn1G90v0t4ZEpEFmKEkzw95vpXl6SMifu8OI5vWLp9/n9V83sp0jPs0rtLSEqIZkHUHz5arYqyavkaD4v6XJO9+vF7hoCaIEHM3jU6KJCG4Yo0I8GNDPqe7eArtf6rr3dj0LwVEKS5lFicAUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856100; c=relaxed/simple;
	bh=oadv2PoCoCr6Yw+lNdg8hGXm6C2bTN2gb1khZEANmEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E//lu35NADI83e+g8i644ZlcVov84nzvaII7WfyCAlbVf5T1tNOkYjNlweNDpuhiW9jVONJfFrlqGD/+LLK8/0CeYj9/yXi2IeWK+rwRxYtRzgE410bIF1YqW4RuhTyRwHobNFxgHxrq9bMs8pg2m+w9kRbWm5DoLnLw+GhoCtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R5RTL6B+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R5RTL6B+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so1694685e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790856095; x=1791460895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Qyf4I107j47S4IbTlOua/eHiQIvNfJl9DXP+9jIXXs=;
        b=R5RTL6B+bb4TUpnVPSbUAGbTA6FzcGsHMkhKhA10q07j1k2gyAXNzzrlvWnetCzhT5
         Pv7DK+8gsKeRoa6oTxBDP4hV6Sx6fkP7xRubuKpmz46peyM1N+AnG19vH45a2HE03SVJ
         oIPamhU04QAiq2/v8DBgEZsPtKTWGMI/mCjps2fzlW7tKTnax5DgkeMQVdyQoVh1eUmW
         ekhHVTxSJ6LI7IyhhBck7l7De7xk/2vgJG3BgI3UUPSjkVn7dP7M0H/cON3FJUepny+v
         1bRZayZdGKyBUTUz/jDW/D0FIjtLuckufqUVVKjnuVjHF11u4SjlBzfDU6EibSr5mo8H
         unkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790856095; x=1791460895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Qyf4I107j47S4IbTlOua/eHiQIvNfJl9DXP+9jIXXs=;
        b=KVE3XP3/fqkK/upnP33tXoetGRy8Q+Tq3worcBCYo+ylIDR0LSMNgQVThbWXV04H8j
         MBxHjYnD9OyyUGn9QNw+bUUGpGiyp4eVjnrVacwRtk/jitxF8F90hgZF0TcfW2K9OhS6
         QkWrCUodw8BZ1uuYzCqqbvVQm+rLLKfIiLXwrFoCjVlVsScURml4Jw6PE2pze/E8wqn8
         FdZtAtgUx6CCqJBe65b/PlfmCANl6iOjjoZ5EsNTvAUJd0beAFQkI4pyIFnNinBqWJp5
         UGqpVxP5RQK0STM0LPJcoIrimwe9To+aNDzxR7FdvW6g8m1RDwDLy43EvX+Qy11KGI7H
         4HGA==
X-Forwarded-Encrypted: i=1; AKwUvBzOYAmN5NFTnEOx6XBoGo3CMJZn6QUQt6ZsyHB42w4/W2RkgnAFaqiW52Mrj6Spji1Y/35OdMAFEvSB2yA=@vger.kernel.org
X-Gm-Message-State: AFuF++nwiTDhuKJKpj3wFd0XklWQYuTx/7Bhd3+2pkqXOKn9MGWFSpuv
	nYbMsHYDmqLRYpYRuQZq6EgzYy/5I8fBPnOi6mWk/2xg7Ga5qBwrL4kylH7q8JpytGo=
X-Gm-Gg: AYBFou2KQJR2GR02Yc7CqIAp5NOIPu44fcIBVEuHGYv/iwzqfWei48BsWuen5wR9LuC
	jkSft+TAA8+yhSSt8Gr41gF4kbASnSOJxdJGiI/vrqd+U6o8lKYDt6ahi3qu3grwl4Kx+RUjNGM
	/8XhuMJ0ExR5bbsuef8DpYD6fGV+jmy5s9hC/MwmO23ZY0+NUB4QmuJGKFB9nVST0EgBYxcRDJN
	aY8sFYQhZvahsvxOnr5KJV6ra1WPs6BId7Yc9lw4dNu57gV2VXoVo4QVAIan26rCdA4D5SJPPji
	boMgH5Pm857putNw8lScuCuBaGHGyKxtCngx04rYZWYMz1E2lAGHrm57jFYO7OmhKc9xCV64JNF
	oCsj6wjiHxKe3y97PT7a1jDltThh/DZK7RurRnnOvTE/zUUzmhny9TrCn7Shw8P2bN61aHc7/qo
	GcLoD+Z7P7A1iatiSnysroDoEEZPZdAIhxgJsYZcF3yCwY3+mYxTUAxwvGrVhBCjFRnbgzs2QM6
	YuPB77tLuE=
X-Received: by 2002:a05:600c:4fcb:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-4a01aff2554mr79526715e9.5.1790856094523;
        Thu, 01 Oct 2026 05:01:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f97a0aesm58427345e9.3.2026.10.01.05.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:01:33 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:01:31 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Fushuai Wang <wangfushuai@baidu.com>, Kees Cook <kees@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>, linux-serial@vger.kernel.org,
	Manuel Lauss <manuel.lauss@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] braille: nbcon: Allow to use a serial console
 with NBCON API as Braille console
Message-ID: <ar5Lm3ZimvIghvFB@pathway.suse.cz>
References: <20261001093946.112999-1-pmladek@suse.com>
 <20261001093946.112999-2-pmladek@suse.com>
 <87jyo18zne.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jyo18zne.fsf@jogness.linutronix.de>

On Thu 2026-10-01 12:54:37, John Ogness wrote:
> On 2026-10-01, Petr Mladek <pmladek@suse.com> wrote:
> > The Braille console is not registered in console_list. Instead, it is
> > integrated with the virtual terminal (VT) and shows what is displayed
> > on the terminal. It writes the data using con->write*() callback
> > of the associated serial console driver.
> >
> > --- a/drivers/accessibility/braille/braille_console.c
> > +++ b/drivers/accessibility/braille/braille_console.c
> > @@ -62,14 +62,45 @@ static void braille_write(u16 *buf)
> >  {
> >  	static u16 lastwrite[WIDTH];
> >  	unsigned char data[1 + 1 + 2*WIDTH + 2 + 1], csum = 0, *c;
> > +	struct nbcon_write_context wctxt = { };
> > +	unsigned long flags;
> > +	bool locked;
> 
> There is no need for @locked because on failure, the function returns.

Great catch! I rewrote the the code many times and decided to send
it at some point...

> >  	u16 out;
> >  	int i;
> >  
> >  	if (!braille_co)
> >  		return;
> >  
> > +	/*
> > +	 * Braille console is not registered in console_list. Instead, it
> > +	 * is integrated with VT and shows what appears on the graphical
> > +	 * console under console_lock(). From this POV it is a legacy
> > +	 * console. But is calls serial console driver which might be
> 
>                      it ^^
> 
> > +	 * converted to the NBCON API. It is similar to
> > +	 * nbcon_legacy_emit_next_record() except that we should try
> > +	 * harder to get the lock. Othewise, the Braille device won't show
> 
>                          Otherwise ^^^^^^^^

My muscle memory is clearly wrong for this word.

> > +	 * everything what is displayed on the terminal.
> > +	 *
> > +	 * In short, simulate the original locking using NBCON API.
> > +	 */
> > +	if (braille_co->flags & CON_NBCON) {
> > +		if (panic_on_this_cpu()) {
> 
> How about adding here:
> 
> 			if (!braille_co->write_atomic)
> 				return;
>
> I see no reason to forbid Braille device usage just because it cannot
> show panics.

Fair enough. I am going to add the following in v4:

			/*
			 * This should be good enough in practice. Most/all
			 * serial console drivers have the atomic callback.
			 */
			if (!braille_co->write_atomic)
				return;

> > +			local_irq_save(flags);
> > +			locked = nbcon_braille_try_acquire(braille_co, &wctxt);
> > +			/* NBCON API strictly requires the ownership. */
> > +			if (!locked) {
> > +				local_irq_restore(flags);
> > +				return;
> > +			}
> > +		} else {
> > +			braille_co->device_lock(braille_co, &flags);
> > +			while (!nbcon_braille_try_acquire(braille_co, &wctxt))
> > +				cpu_relax();
> > +		}
> > +	}
> > +
> >  	if (!memcmp(lastwrite, buf, WIDTH * sizeof(*buf)))
> > -		return;
> > +		goto unlock_nbcon;
> >  	memcpy(lastwrite, buf, WIDTH * sizeof(*buf));
> >  
> >  #define SOH 1
> > @@ -102,7 +133,27 @@ static void braille_write(u16 *buf)
> >  	*c++ = csum;
> >  	*c++ = ETX;
> >  
> > -	braille_co->write(braille_co, data, c - data);
> > +	if (braille_co->flags & CON_NBCON) {
> > +		nbcon_write_context_set_buf(&wctxt, (char *)data, c - data);
> > +		if (panic_on_this_cpu())
> > +			braille_co->write_atomic(braille_co, &wctxt);
> > +		else
> > +			braille_co->write_thread(braille_co, &wctxt);
> > +	} else {
> > +		braille_co->write(braille_co, data, c - data);
> > +	}
> > +
> > +unlock_nbcon:
> > +	if (braille_co->flags & CON_NBCON) {
> > +		if (panic_on_this_cpu()) {
> > +			if (locked)
> > +				nbcon_braille_release(&wctxt);
> 
> There will never be a locked=false scenario here. We already returned.

Right!

> > +			local_irq_restore(flags);
> > +		} else {
> > +			nbcon_braille_release(&wctxt);
> > +			braille_co->device_unlock(braille_co, flags);
> > +		}
> > +	}
> >  }
> >  
> >  /* Follow the VC cursor*/
> > @@ -353,13 +404,22 @@ int braille_register_console(struct console *console, int index,
> >  	if (!console_options)
> >  		/* Only support VisioBraille for now */
> >  		console_options = "57600o8";
> > +
> >  	if (braille_co)
> >  		return -ENODEV;
> > +
> > +	if (console->flags & CON_NBCON &&
> > +	    (!console->write_atomic || console->flags & CON_NBCON_ATOMIC_UNSAFE)) {
> > +		pr_err("Braille console requires a safe braille_co->write_atomic callback\n");
> 
> IMO it is not necessary to restrict to !CON_NBCON_ATOMIC_UNSAFE consoles
> because if the acquire fails, an unsafe acquire is tried anyway. But as
> I suggested earlier, I think even NBCON consoles without
> ->write_atomic() should be allowed. Just no panic message for them.

I agree. I did not revisit this after I enabled the unsafe takeover
in panic(). I'll remove it in v4.

> > +		return -EINVAL;
> > +	}
> > +
> >  	if (console->setup) {
> >  		ret = console->setup(console, console_options);
> >  		if (ret != 0)
> >  			return ret;
> >  	}
> > +
> >  	console->flags |= CON_ENABLED;
> >  	console->index = index;
> >  	braille_co = console;
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -2002,3 +2003,80 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
> >  	 */
> >  	__nbcon_atomic_flush_pending_con(ctxt->console, prb_next_reserve_seq(prb));
> >  }
> > +
> > +/**
> > + * nbcon_is_braille - Checks whether the nbcon write context is using Braille console
> > + *
> > + * @wctxt:	checked nbcon write context
> > + *
> > + * Return: True when the write context is associated with a Braille console.
> > + *	   Othrewise, return false.
> > + *
> > + * Context: Can be called in any context but only when Braille console is
> > + *	registered and the struct console could not disappear.
> > + */
> > +bool nbcon_write_context_is_braille(struct nbcon_write_context *wctxt)
> > +{
> > +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> > +	struct console *con = ctxt->console;
> > +
> > +	return con && con->flags & CON_BRL;
> 
> I suggest parenthesis around "con->flags & CON_BRL".

Will do in v4.

> > +}
> > +

Thanks a lot for the quick review and catching so many details.

Best Regards,
Petr
