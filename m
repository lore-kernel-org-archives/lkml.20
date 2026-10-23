Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751780;
	b=ip7graGmWMCnAccHjB++9iEutpxlcBtw8TNPTnzVwmpbWhmJlW/m2ASV6TsZC4DvO6hy
	 1BtqaNV++IBOgs7fh5XHWvBMF1eNX4EwZasmSRHrYQRk/HrG72m08ldHU/q1DSO+azBCe
	 s/zx3w0kRAmDp1/MYrLpZjZPAnq6SJmm6lWbwLlE5sO2UgAtqi5AEkLx6HZbWP2uG/3uP
	 sXZjhh0p7PqScujeZSdjeakQ3RAfCxPua9Px38xzHQmlVabZpE2JCeksNfr6EFVYzYjKJ
	 2Jyqde2dWPhxWNinDoXPzHITvXSVT3bPxDfbh6V1Wwkb595ZGCjWYXOzlWTiQZihm0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qy4sOYVxxJ6hwis1QSUqFFZjdE9a9FIKKTm12Pv4zno=;
	b=v7warcKHfk9/tuiNpP3hvBB9N5iBGvM56mahzAiPP+A2jDJReeA6HtEzlYGBRhdfKklN
	 h2YNyi9Brv7cKi+oRNeJuRmBJ+5REiGOvI+DNA78JnHqTj7JmnYgXMw1DxnDfLV2ncIk0
	 KxZr91mVayCOokEP62T8lQkLvn3GNQvT9i9FcldVh9fZbwMqSllaJGlt3GBMR5HpsnGGe
	 s0jJ3HPgP2YXlT480ZwJoqRwnx8TXGMBZO51pGDgnF4yAttwnIws3tdwUCL3lEGzFFqm2
	 S2nyk0hlhBPOBCuiQStumA2zJ2qIF4QubNYUXRRb5pIdcOJZna5NLS+JsUqhbXqk2nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LwzvbNfJ;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E81606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E81606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LwzvbNfJ
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so572521f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792751778; x=1793356578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qy4sOYVxxJ6hwis1QSUqFFZjdE9a9FIKKTm12Pv4zno=;
        b=LwzvbNfJQgtGdi6DrnmmYLhEJJUs7fn57D7AeIkakiAepU8BIwNKv+ESHWyP3Jb//t
         78UJQVlv+xX4klDM/aZYG5E1kAvQiqUPX+4ncwsj1xuOCTHLtey8RBB5RHAk4vBBHcF1
         f0jctThtrT7HtQw+PyAdlfiAKTPdTzzhZ0ElgOazNzIMXEX1nvO1neBM3gVKDUNqUSTB
         1MhvmJ6I5tJ98Qd0QV7vgo61okoKP7gigpd1sh5NI5kLNZPFjU6p0aScVRipoT/gIuH0
         dZvaO6sXmAw3KxZBYT65zPf+3rOW9P22+5VUHt18NocKh0efBUcrJJ4ThrKVL5UD+3kk
         +uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751778; x=1793356578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy4sOYVxxJ6hwis1QSUqFFZjdE9a9FIKKTm12Pv4zno=;
        b=IDzdTzv6cBwBZBV8mX7M9ymwkHX/71hUkytoEc9ZTOX5DFNkxCFkEnZOGyErJA2TJ0
         8cZm7wrDv6deqIQnWPz0xdWSIOq/pbiFnKbGQsSJ1TsfillYTBcdbolDdsL+us9+R7Zn
         0ik1Uec91qQKNWDrGYD0OmO6AycFwYRke2LK32Y2+h3dYBsmhu0F0sye4cOY6PAN5Dr5
         ZW2Y/Yhi1O08s9RcKQJDuOBnU7uOlbaTiokgG21z0t7L3uPC3k++Y6ZWSol1EIaOKZYl
         NIrkPAUAEldsqggMF+RNTQl5soGmo1uegsUckkxIhi5bfKHj8gckZGnCimWC5/G0TuRh
         GBRA==
X-Forwarded-Encrypted: i=1; AKwUvByw+iSoSVhJF+z9UlKfrV10hbuC9K7zzvd8YZb6nm2f2dkpGdW1p8qfJ2ZxClQj5+scxrZNal/b62TDyck=@vger.kernel.org
X-Gm-Message-State: AFq9FYInvXU6/ACt/x7tTPT8mEMPUhlYkdKQ7lK7cUigXT9S1o2SSpRD
	iH92SxyZSCzVehvteC0SFhDzVIuv0SfBXXUMW2Ue2CmQRd9uDJmaek/s9IZMmXWFcWQ=
X-Gm-Gg: AYBFou3llO3HCWGfyOQ9Gp4hi9WrZMzGrzMtwZ4L1Bu0iT4TcbNq9YPznc4Yc+umFCB
	fjSBfSGaWcLEt092C0ucofS6ubChGkQF5MXiaTyD1SiD550tEJtLZxQllB6hIWzqJkLon1T1Jo4
	6mCQv8LZ1I2tIYsF049tB7FccA4uwG0MQ1Y4+ImjsKPYxe94igwCAkQCMoYT2o82qy/fk9SV90P
	LOCHvmuThAMUqyOxHM4lMr0Emy/5PRuPIaM35AAtZmAuXcLYJtJ36GxkPc9vJmfDYSGtNNDUv2T
	iKaZXtizhm5nsGrdl/4VgpljdZza+Sof/z7E2mWwsoA5ODOLQeMr0qpx1//PCsvjA38fxU0fihI
	aE9NjFz0ZrfxW1sKy8aReXnFsT9KAR/+8XJnKHdToOXHPaCopEu0vaBgcUTOGb3Jm8iXE+wEc5m
	NHmJ3gHw15QWRTlVKpzx03VwlhxbJL15W/9dstwnRJaRaCbigzv28othppQ2dMFptx3QKHxr5M0
	faUVcNspGA+lAMUPTf2/o96LlSF9YoXOKV0T3m0/YxdesM9JFWcnNrNCA==
X-Received: by 2002:a05:6000:98f:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-48e385ac43bmr2868391f8f.18.1792751777845;
        Fri, 23 Oct 2026 03:36:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380636bcsm4195427f8f.58.2026.10.23.03.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:36:17 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:36:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <ats4n8snmReT7Nc9@pathway.suse.cz>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
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
In-Reply-To: <87bj8kkfwk.fsf@jogness.linutronix.de>

On Fri 2026-10-23 10:03:47, John Ogness wrote:
> Sorry for the late response... this fell through the cracks. Response
> below...
> 
> On 2026-09-16, Petr Mladek <pmladek@suse.com> wrote:
> >> In older kernels (v6.19 and earlier) netconsole is able to print these
> >> panic logs while the system is configured to reboot on panic. So from a
> >> user perspective this is a regression caused by commit 7eab73b18630
> >> ("netconsole: convert to NBCON console infrastructure").
> >> 
> >> We have automated test systems without BMC access, which rely on these
> >> two features working together.
> >
> > I see. To be precise, I would say that the primary culprit is the
> > commit 187de7c212e5fa87 ("printk: nbcon: Allow unsafe write_atomic()
> > for panic"). It adds support for consoles which will be flushed
> > in panic() only by nbcon_atomic_flush_unsafe().
> >
> > It is a big difference because printk() tries to flush both
> > legacy and "safe" NBCON consoles directly in panic(). In addition,
> > they are explicitely flushed by console_flush_on_panic().
> >
> > console_flush_on_panic() is called more times in panic().
> > And it tries to flush legacy consoles the unsafe way even
> > before emergency_restart().
> >
> > OK, we should close this gap. But I suggest another solution.
> >
> > We already have the following functions for flushing NBCON
> > consoles using write_atomic()
> >
> >
> >   + nbcon_atomic_flush_pending() - flush CON_NBCON consoles
> > 	using con->write_atomic() but only when safe
> >
> >   + nbcon_atomic_flush_unsafe() - flush CON_NBCON consoles
> > 	using con->write_atomic() and allow unsafe takeover.
> >
> > I suggest to add 3rd variant, for example:
> >
> >   + nbcon_atomic_unsafe_flush_unsafe() - flush
> > 	CON_NBCON_ATOMIC_UNSAFE consoles with con->write_atomic()
> > 	and allow unsafe takeover.
> 
> nbcon_atomic_flush_unsafe() already includes CON_NBCON_ATOMIC_UNSAFE.

I was not clear enoungh. The purpose of the 3rd variant was
to allow the unsafe takeover only for consoles with
CON_NBCON_ATOMIC_UNSAFE. And rely only on the safe atomic flush
for consoles which support it.

But it is likely too complicated and probably not worth it.


> > And I would call this 3rd variant in console_flush_on_panic(),
> > something like:
> >
> > void console_flush_on_panic(enum con_flush_mode mode)
> > {
> > [...]
> > 	printk_get_console_flush_type(&ft);
> > 	if (ft.nbcon_atomic) {
> > 		nbcon_atomic_flush_pending();
> > 		nbcon_atomic_unsafe_flush_unsafe();
> 
> s/nbcon_atomic_unsafe_flush_unsafe/nbcon_atomic_flush_unsafe/

Yes, I am fine with this.

> console_flush_on_panic() is used in multiple places and depending on the
> user, it may be too risky. Yes, if there are legacy consoles the user is
> already taking this risk. But with nbcon we would like to excercise some
> risk management.
> 
> > If there there are people really concerned about the reboot
> > reliability then we might need to make it configurable, e.g.
> > by adding reliable_panic command line option which would skip
> > the unsafe flush before reboot.
> 
> Yes. When originally developing the nbcon, tglx and I talked about many
> more details related to this topic. For example, the ability to order
> the unsafe flushing. That is one of the reasons that nbcon flushes the
> full backlog for each console, rather than each console only flushing a
> single record.
> 
> If we are going to expose an interface to configure if unsafe flushing
> should occur, then we should also consider ordering. Even if we do not
> want to build in the ordering support right now, the interface should be
> such that it can be easily extended to support this.
> 
> *** WARNING: Now we get into my brainstorming, which could be rough. ***
> 
> Rather than a big hammer option, I see this more as a per-console
> configuration (similar to how we want to go with the console loglevels).
> 
> Netconsole is a bit tricky, because it has its own format separate from
> console. This would need to be addressed for the per-console loglevels
> as well. Maybe it should be extended to something like:
> 
> netconsole=[+][r][src-port]@[src-ip]/[<dev>],[tgt-port]@<tgt-ip>/[tgt-macaddr][,options]
> 
> Which would allow things like:
> 
> netconsole=@/,@10.10.0.2/,loglevel:3,unsafe_panic:1
> 
> This would also allow to specify that consoles should _not_
> perform unsafe flushing:
> 
> console=ttyS0,115200,unsafe_panic:0
> 
> And it could be used for ordering, flusing from highest value to lowest:
> 
> netconsole=@/,@10.10.0.2/,unsafe_panic:2 console=ttyS0,115200,unsafe_panic:12
> 
> (First ttyS0 is unsafe-flushed, then the netconsole is unsafe-flushed.)
> 
> For consoles with CON_NBCON_ATOMIC_UNSAFE, the default would be
> unsafe_panic:0. Otherwise the default would be unsafe_panic:1.
> 
> Unfortunately the above idea does not consider the reboot vs. busy-loop
> paths. I could imagine there are those that only want a different
> ordering/disabling for paths where the kernel will continue to be useful
> (for example, a reboot). I think that makes sense. But I am not really
> sure how that distinction should be made. We don't want to configure
> ourselves to death. Maybe that distinction is not relevant.

This sounds reasonable. And it is good to have a plan.  Well, I would
add this complexity only when there is a real demand for it :-)

Best Regards,
Petr
