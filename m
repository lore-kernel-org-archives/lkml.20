Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782971C84D0
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750351; cv=none; b=IDc4FZv21Q3UgGigmmrJrHC2wWWihiZ5DSu+LjVkkREmhXSHQ2ievBSytyS9W5DbXoFTOWwNEjznJVWgXWv/uit9cZxR4lmbYYsUUl7QhJKZMe2yG8K3RTxcZlMdiDbx9Mp4G4MuEO+uhtIdUxB2YG7E6Zr71dCwO5K/Q2v2tt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750351; c=relaxed/simple;
	bh=V8tI2WwfYdoGTSKdyfhfe0SVh2XJN3VSD5Oiov57r60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/pX89omKCpzkZU2ghVqL2Y3jz30bXB0eekvijJrvSPKxSBlY9vofoI9wFuK7p0cm2aHXT0EHVFopsOGafPDjnDy21oo79BJ5DCGMncSpJogEaPh6BLoXB3SSXFFEoUhzPk7n7stOJXNMpP1EWXjfZvhkKnrl0KdT59fbO3lz/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J3FbBFm+; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J3FbBFm+"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so1570178a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787750343; x=1788355143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wh6RHOf+V6h8MwLxQU47047jXHcjoJgTsSY0f6dMFcM=;
        b=J3FbBFm+NLI9x/xPSgl3gAQY+jh7SiYHD8BUA/T7VsvZ5jtu1ZtisYB/Q5qY2uXxTx
         XacG1ekh51zijabcNSfal9LObRdorDC4BgYSK2Eqsyn7Pls0Z/iO+FIaNisuY0PAVdF4
         CxKG8EnTxR/Ixd5uYVI9rXxvLjvIfckEZ8c/G32GNpMh+2BPqMpNBMPhUA0S1/ZcmsQo
         2DihmSfxkUopJYCZmigZLeeeNtYC49nTX1t2zRL/UckL0mlsS5zVHqnCvIvcfzxqJKhf
         a42o5QcxIcFPbpo2fLDVPfxKPIUN408/85+qSX628DUsMhQjNhHXiJpSarqtFbQxQkcB
         h+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750343; x=1788355143;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wh6RHOf+V6h8MwLxQU47047jXHcjoJgTsSY0f6dMFcM=;
        b=NvgeA8h+mqCJlou3lzQ2JNl+sMv0i2s430v9jexLGA4EEpFQMlQsAVbZidtyKrYpHz
         yX8G9jm8udTsYcmh+UwevEoQam0rTh8jypaEU7T7ucCMTc20waCsvkqxmjfcHyuda5Iu
         dCMcV+94+Njt1w8ljTik1qdYFdWJWcM5g8t9aLAXbly893K9a9V82uZUyVVk0Ont5fbd
         DKXu9KITNogl0hDOi9Upxn7wpwwRf80m5o8NBcQslbX8zIq8sab987uI84RJXt+69w5I
         tZ06OIrGsc6SetmrQe+JRLJYhrNBZajoEUOkaj/CJc43NqGirNOi4ktxFFub5VhPim71
         ZsUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6+wqyFPZ7rXM4dyBk7JZK7OILMtTEFJvAuf2fwV8ALOTZJZh/50gtQx+wiFBtv+feVLkJXGxYGdZS5ds=@vger.kernel.org
X-Gm-Message-State: AFuF++ldUbkFkwo1NfpZzormlscdJbPbxsDTP2y3t645eiPy4xNVRRdj
	wado4GlOmTycGfRFdCsPevdjh4iE+ioCRwaOJ3//onkfX0G7DYTTeYrs9SdpoctDPaY=
X-Gm-Gg: AR+sD10mJb5N681c+HYuxFgEn3Nzh/hwhVAjob9VfosFDNT+EgRVjuFA8G+4aCifama
	0Vg/hAHKTc5RsPQKiWsG/NVqSCrmC+AEPg0TOMP+4Lk77WiI+YdbgEb47koonKN1jv36PMQfQJF
	CmVzBklMC5pExWXSwPWhMntHf/wkNvuQaEAL7V+usN9/moDUx7prItK/8yMetAd8FJk4GFzzpQ0
	B3Vq0BgpOmy+cNzPkBZNKz1d5ELII+f7XjXTp1/usUb6Mr7eGkX909pypnwTAZXZ49KqDtMXQNX
	832CiMoA4Uaryolsz7Nl93f8X0MJxXXO/q/uyhodWyxksUNz1QhS5b+tOjZQI1k1ReqrO6Xj/Kz
	9Q5ssKqMOwRpJ8Llf/dT+DPnADkdvio0jc2S+9wQ4qIL4uRHHWkQvJ6iT7L/+KGL3Lj4dl8HxON
	KBpWISoFoADCgT5xCOlCoG0VXC0NjWwuyfQvYkVIo35VNk/koeCA1FnO4YFeNR5bnwIAg3P3HB
X-Received: by 2002:a05:6402:3815:b0:698:8847:e2f8 with SMTP id 4fb4d7f45d1cf-6a5df67cd02mr9785290a12.15.1787750343018;
        Wed, 26 Aug 2026 06:19:03 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83ba0sm4262870a12.14.2026.08.26.06.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:19:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 15:19:00 +0200
From: Petr Mladek <pmladek@suse.com>
To: Xiaochun Li <lixiaochun@open-hieco.net>
Cc: rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: Remove remaining boot consoles when a real
 console exists
Message-ID: <ao7nxHdveoIqFvQT@pathway.suse.cz>
References: <20260821071721.178517-1-lixiaochun@open-hieco.net>
 <2f783c1d-6f2f-41eb-9d86-a4ce47e0c167@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f783c1d-6f2f-41eb-9d86-a4ce47e0c167@open-hieco.net>

On Tue 2026-08-25 14:35:10, Xiaochun Li wrote:
> On 8/21/2026 3:17 PM, Xiaochun Li wrote:
> > Boot consoles are temporary and should be removed once a real console is
> > available. However, the late init cleanup currently only unregisters boot
> > consoles that use init section memory. Other boot consoles are expected
> > to be removed when the real preferred console is registered.
> > 
> > This does not cover cases where a real console has registered, but the
> > boot console was not removed because the real console did not become the
> > preferred console. For example, with multiple console= parameters using
> > the same driver, a real 8250 console may be enabled while the early
> > console remains registered. The result is duplicate printk output from
> > both consoles.
> > 
> > In the mailing list discussion, two possible approaches were suggested
> > to fix this problem [1]. This patch implements the first one: during
> > printk_late_init(), check whether at least one real console is already
> > registered. If so, unregister all remaining boot consoles. If no real
> > console exists yet, keep the existing behavior and unregister only boot
> > consoles that reference init section memory, avoiding a period with no
> > console output while waiting for a deferred or modular real console.
> > 
> Sashiko AI raised the following concern about v3:
> 
> | Does this logic unintentionally unregister boot consoles when an unrelated
> | real console is present?
> | If a system boots with multiple consoles (like console=tty0 console=ttyS0
> | earlycon) and an unrelated real console like tty0 (or dummycon) registers
> | early, have_real_console will evaluate to true here.
> | Because have_real_console is true, the init-section memory check is bypassed
> | entirely, and the boot console is unconditionally destroyed:
> |       if (keep_bootcon || !have_real_console) {
> |               // bypassed
> |       }
> |       unregister_console_locked(con);
> | If the real driver for ttyS0 is modular and has not loaded yet, won't this
> | leave the serial console dead and cause a loss of console output during the
> | window between late_initcall and the module loading?
> 
> I think this concern is valid for the case where an unrelated real console
> has registered while the real console corresponding to a remaining boot
> console is delayed by deferred probing or module loading.
> 
> `have_real_console` is intentionally global in this patch. The purpose is to
> handle the case where a real console has already been registered but has not
> become `CON_CONSDEV`. In that situation, the existing registration path does
> not remove the remaining boot consoles, and duplicate output may persist.
> 
> Therefore, when `printk_late_init()` observes any registered real console,
> this patch deliberately removes all remaining boot consoles without trying
> to establish a one-to-one correspondence between them. This does introduce
> a trade-off: a boot console may be removed even though its corresponding real
> console has not registered yet, creating a temporary loss of output on that
> console.
> 
> Unregistering the boot console does not remove records from the printk ring
> buffer. A later real console may replay some or all of those records,
> depending on its flags and sequence initialization. However, this does not
> guarantee that messages generated during the gap will be visible, especially
> if the system fails before the real console registers or if the records are
> overwritten.
> 
> This patch implements only idea 1 from [0]. It does not solve the problem
> comprehensively. We plan to investigate idea 2, based on the work in [1],
> which should allow the cleanup decision to be made with more precise
> information about the corresponding real console.
> 
> Do you think the trade-off described above is acceptable for this patch?

I believe that this is acceptable. The same problem existed even
before. The boot consoles are unregistered at the end of
register_console() when the so-called preferred console gets
registered. The preferred console is defined by
the last console= on the command line.

The preferred console might be the graphical ttyX. So the serial
early console might get unregistered before the proper serial
console driver gets registered and it might cause the above
described gap.

More details:

I have just double checked the code in register_console().
It looks like:

void register_console(struct console *newcon)
{
[...]
	/*
	 * By unregistering the bootconsoles after we enable the real console
	 * we get the "console xxx enabled" message on all the consoles -
	 * boot consoles, real consoles, etc - this is to ensure that end
	 * users know there might be something in the kernel's log buffer that
	 * went to the bootconsole (that they do not see on the real console)
	 */
	con_printk(KERN_INFO, newcon, "enabled\n");
	if (bootcon_registered &&
	    ((newcon->flags & (CON_CONSDEV | CON_BOOT)) == CON_CONSDEV) &&
	    !keep_bootcon) {
		struct hlist_node *tmp;

		hlist_for_each_entry_safe(con, tmp, &console_list, node) {
			if (con->flags & CON_BOOT)
				unregister_console_locked(con);
		}
	}
[...]
}

The comment above the code says that the boot consoles are removed when
a real console gets registered. But it is _not_ right.

The meaning of the CON_CONSDEV flags is historically pretty
complicated.

The name CON_CONSDEV suggests that it should be set for
the console driver which is associated with /dev/console.
But it is just the best effort.

The driver associated with /dev/console is selected by
console_device(). And it returns the first driver where
con->device() exists and return !NULL. It does not check
the flag at all.

Unfortunately, con->device() might returns NULL in
register_console() and some real value later. It is related
to the ordering of initialization of various subsystems.
Anyway, the result is that register_console() must guess.

Plus there is the rule that the preferred console (last on
the command line) should get associated with /dev/console.
For this, register_console() must put the preferred console
to be first in console_list.

Now, back to the best effort. CON_CONSDEV is set by:

   + try_enable_preferred_console() _only_ for the preferred console.
     This function is used when some console is preferred on
     the command line or via SPCR or the device tree.

   + try_enable_default_console() for real console drivers.
     This function is used when there is no preferred console.

   + register_console() and unregister_console_locked() for
     the 1st console in the console_list. It is a hack
     to make sure that at least one console has the flag set.
     And it might be set even for a boot console.

   + console_force_preferred_locked() for the given console.
     Some platforms have their own preferred console.

Summary:

It is complicated. But in short:

   1. It might happen that CON_CONSDEV points to boot console
      => register_console() does not remove boot consoles
      when a real console (not the preferred_console one)
      gets registered.

      This is why it makes sense to remove them in printk_late_init().

      => this patch makes sense.


   2. register_console() already might remove boot consoles
      before the corresponding real driver gets registered.

      => the race already exist.

      => this patch looks acceptable to me.

Best Regards,
Petr

PS: I am going to take a break, coffee, and actually review the patch ;-)
