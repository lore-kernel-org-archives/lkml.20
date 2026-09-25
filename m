Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5DD2848A7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346872; cv=none; b=mFmvu3YAXQZ24/gt3sUdU4yC7GNUzu3ipwo/I/N2HyJ1NWqxYtTnNGKfkxeXhMtuOaLWUxbY9l03kiihjeMmdJgB0DWexJP+BU/GFsm+iOKQjsnLPmRwIxjR5LK0MQRxgEDiJceoIyvIuYwgN+b0Ba7y6/gamrT7UEwdnxLZyXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346872; c=relaxed/simple;
	bh=il+wEG3AtIzGlK5bGCdksKp2QOycmjV+Bh3XYtN8+zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvF+wRRYLqx7/XMl69W7i6m+zLjvJIet35JAw1Yort8CZ7Uwk87dlj4R+/s9tpMf329AhDUOBLDP/D3hl6P25fcXMNJA5InQz7KIgeh+NZZIWIEkop+rFIiICqu56XFcNEFyHcepKlElFExRJEMNSQXOuus2AmJ8Esa7/HhEF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=es/YJ9qx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="es/YJ9qx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so6085085e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790346859; x=1790951659; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+cqV5QZnriB3z7y6e0i2pSd1fJ+pgI9FmJRPQglWgqU=;
        b=es/YJ9qxaX9SQ+hHLRBBKAVFXr9naaBKF/I8hD1niz8g1W4W6UhwSdlIVkxguFE9da
         vv9Nygfgm6g/y+CsjB8DMaH5MAyZnFRuZcMGLvgSZWimzapIli0y7LWEpANoY6NzJ8RK
         R3b9hz7MLI0Hob4+Q42OdCfNupoc1ZcD1v8dYexyVEBWLTsKWF/XYMuu8fwfAe6PNg7/
         UKfjAKihrz+6+f55cDYmgW9Bo1Jw042KCWK8YrMsywgc1HaPzC+7ZxSGYsY6UPQDoGgN
         IWY5qNODnY0MlWL1zrwxhMqupccLhxg/Ss/w9p98NsTxPy4EwSNtj8iKu9xPfBVQ7/vh
         CV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790346859; x=1790951659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cqV5QZnriB3z7y6e0i2pSd1fJ+pgI9FmJRPQglWgqU=;
        b=LXmB8/n7Hp6r6JbDML7t+fQIaM6u4BaMYUzpMlTKtEdr9YuxNj+TYyb4vsVOq/LcuG
         h+An1TEdBaKE59I807i0sMYw5rhzURUc6/iiK1JF1u4/J1xoSoWMoOF6UsXRwCIDvzaT
         brDqWkhIzYUNCZzYHcMcoErhR21n//UNXv7KLqZzgle34+ePgspUpK4kPA4ux5kYh9G5
         9SVTJKT6ckivLdvHiuhFxJZnwioJ+D2XoCdNwlGfKDsgb9ZiQ8vKUmDOvQvXzBq6CN+6
         MNFxnimxcx1GpyhFzvprfkzfhxAy58ExLCS0DM6gmV825a4F7ggb+6DRFoZEKP3ZeeHM
         ZZcw==
X-Forwarded-Encrypted: i=1; AKwUvBzhiPUT8zIPus477AU9ecBFW4+wRbSYx3kNnpfrK8gxvJP1AxK4pPTZ1vvYloPn5arHR27a9WN1uEpSTLw=@vger.kernel.org
X-Gm-Message-State: AFuF++n3eVTqz2z9uIymSGGXR1eYo7o9gxOpVoUX98v4xlzdOdNOAirx
	RR5edSdYxIwVdT3fV2ZapNCf/BVUBSzX/lYA+McpuMtVNBCr6GJab2d1qMIv+XyzHOw=
X-Gm-Gg: AYBFou2mNGB2kWyAsM7LDZD9tvI7hg+XFeni0L9WSHXZxtZkYont1gstJRW8bstLEcS
	kH1gB0qSZYF7yQ88ucHkpyfWbanKG8RE7Oi9Lk9wOyhPDay3qwckz2ZLTvT/PPxvqp+7IwfUT83
	LMXj7M3hthpnH3QrZaKeR1wiqUQwmlkgmWOriTAltGdTDuCnDZYO21AlQPSwxEsh/FF8+LmQGtw
	hH28RDcgGrBqtBlMn53lX8Mv3bqeYV/nLp9Gk912SkFJuVbVjDhamv9Lvgrn7DpskSXfPu1z/k4
	p7s3iaNv/sxPrXG8W2ODGyAO/ic+YYL0VnjO39+fiw8502blmq/wZs/jlfoBcaXbs00aDpcdm5l
	sySekWnoDr1ijs1pT8CfgL1K8tovn/jdEurmNp885TUuT5iWTMHF6gnpB1BgDTnltu2anUEidAH
	AtWY+aJw714lOjJjB1uqth9WS8FCu0fhreD0speugZaPItOq3vVmPFhueQpSj3vn97bSmA
X-Received: by 2002:a05:600d:8653:10b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-49fe70151ebmr77731185e9.9.1790346857984;
        Fri, 25 Sep 2026 07:34:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff023f12esm64270415e9.0.2026.09.25.07.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:34:17 -0700 (PDT)
Date: Fri, 25 Sep 2026 16:34:12 +0200
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
Subject: Re: [PATCH 1/2] printk: nbcon: Introduce Braille helpers
Message-ID: <araGZN5_ixhM4AXh@pathway.suse.cz>
References: <20260922072558.98854-1-pmladek@suse.com>
 <20260922072558.98854-2-pmladek@suse.com>
 <87fqyxigqj.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fqyxigqj.fsf@jogness.linutronix.de>

On Fri 2026-09-25 15:54:52, John Ogness wrote:
> On 2026-09-22, Petr Mladek <pmladek@suse.com> wrote:
> > These helpers will be used when calling console->write_atomic
> > in the Braille console driver.
> >
> > The Braille console is not registered as a standard printk console.
> > Instead, it is integrated with the virtual terminal (VT) and writes
> > data using the legacy con->write() callback of the associated serial
> > console driver.
> >
> > When the underlying console driver is converted to the NBCON API, the
> > Braille console needs to use the con->write_atomic() callback instead.
> > This callback must be synchronized by acquiring the nbcon console context.
> >
> > Fixes: d3539347022a ("serial: 8250: Switch to nbcon console, take 2")
> 
> This is not 8250 specific. But I am not sure which commit you want to
> mark as Fixes.
> 
> For 62627bf0cadf ("kdb: Adapt kdb_msg_write to work with NBCON
> consoles") there was no Fixes tag.

You are right. I somehow though that it was connected with the uart
8250 serial console. But the code allows to use it with other console
drivers as well.

Well, I guess that the driver was created for a particular Braille
device. I wonder if there exists Braille devices working with
other serial ports which are compatible...

I could omit the Fixes tag. But I think that in practice it is
primary for the uart 8250 driver.

> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> > ---
> >  include/linux/console.h |  8 ++++++
> >  kernel/printk/nbcon.c   | 59 +++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 67 insertions(+)
> >
> > diff --git a/include/linux/console.h b/include/linux/console.h
> > index 502d1abe3f50..d780f6de303a 100644
> > --- a/include/linux/console.h
> > +++ b/include/linux/console.h
> > @@ -615,6 +615,10 @@ extern bool nbcon_allow_unsafe_takeover(void);
> >  extern bool nbcon_kdb_try_acquire(struct console *con,
> >  				  struct nbcon_write_context *wctxt);
> >  extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
> > +extern bool nbcon_is_braille(struct nbcon_write_context *wctxt);
> > +extern bool nbcon_braille_try_acquire(struct console *con,
> > +				      struct nbcon_write_context *wctxt);
> > +extern void nbcon_braille_release(struct nbcon_write_context *wctxt);
> >  
> >  /*
> >   * Check if the given console is currently capable and allowed to print
> > @@ -678,8 +682,12 @@ static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
> >  static inline bool nbcon_kdb_try_acquire(struct console *con,
> >  					 struct nbcon_write_context *wctxt) { return false; }
> >  static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
> > +static inline bool nbcon_is_braille(struct nbcon_write_context *wctxt) { return false; }
> >  static inline bool console_is_usable(struct console *con, short flags,
> >  				     bool use_atomic) { return false; }
> > +static inline bool nbcon_braille_try_acquire(struct console *con,
> > +					     struct nbcon_write_context *wctxt) { return false; }
> > +static inline void nbcon_braille_release(struct nbcon_write_context *wctxt) { }
> >  #endif
> >  
> >  extern int console_set_on_cmdline;
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index d17704fe93ae..a5e053ffe4da 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -2002,3 +2002,62 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
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
> > +bool nbcon_is_braille(struct nbcon_write_context *wctxt)
> > +{
> > +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> > +	struct console *con = ctxt->console;
> > +
> > +	return con && con->flags & CON_BRL;
> > +}
> > +
> > +/**
> > + * nbcon_braille_try_acquire - Try to acquire nbcon console for braille_write()
> > + *
> > + * @con:	The nbcon console to acquire
> > + * @wctxt:	The nbcon write context to be used on success
> > + *
> > + * Context:	braille_write() for emitting a single buffer on Braille console.
> > + *
> > + * Return:	True if the console was acquired. False otherwise.
> > + *
> > + * Braille console is not registered as a proper printk consoles. Instead,
> > + * it is integrated with the graphical virtual terminal.
> > + *
> > + * This function acquires the nbcon console using priority NBCON_PRIO_EMERGENCY.
> > + */
> > +bool nbcon_braille_try_acquire(struct console *con,
> > +			   struct nbcon_write_context *wctxt)
> > +{
> > +	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
> > +
> > +	memset(ctxt, 0, sizeof(*ctxt));
> > +	ctxt->console = con;
> > +	ctxt->prio    = NBCON_PRIO_EMERGENCY;
> > +
> > +	return nbcon_context_try_acquire(ctxt, false);
> > +}
> 
> This is really the same thing as nbcon_kdb_try_acquire().
> 
> As you mentioned in your cover letter, it is a bug that
> nbcon_kdb_try_acquire() enters an unsafe section because @unsafe is a
> bool rather than a usage counter.
> 
> Since we have limited bits for struct nbcon_state, we need to stop
> entering unsafe within nbcon_kdb_try_acquire(). As I mentioned in the
> response to your cover letter, all the other CPUs should be quiesced
> anyway.

I working on v2 today morning and looked at it from different angles.
I decided to send v2 where I described my thoughts, see
https://lore.kernel.org/all/20260925141729.173943-1-pmladek@suse.com/

I guess that we need another solution at least for PREEMPT_RT.
But I am not sure how to do so correctly.

Sigh, the Braille console is quite a hack. I am afraid that the NBCON
API is not ready for this use case. IMHO, the most similar user
is nbcon_legacy_emit_next_record() which is used to flush nbcon
consoles from the legacy loop when some early console driver is
still registered.

Best Regards,
Petr
