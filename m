Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFA7476CF1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163192; cv=none; b=PSrmZJeWAp2KbjE4SF9Y6Z9IVQd7wfv3yzIgTQjIkY6A1CeHzHzeDMRGW/PrSzZw85WYAFvTvI+Cyr4MhBp5xZQlAQRAMHlQCTIS+WVTAgnS66BcjZTiqUk5xStREih7OfsEv/6OAL4Lk9wQl30/2ZxUVG4UQlH3O+i7flmOIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163192; c=relaxed/simple;
	bh=mxm7ScwRRcKhi5/pmMJ+ipWRaMOsBxv6GnFrY4d2nZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjMHaO20CtHfrp+lSYP9JZ+Cd8IUwUWfiHGXHNhe+iut+wqgly3decPGdayb7I/+Chh6VrQJgMpZA+ULP9vBn7luUGHrBsae/76QGqhYYm9j9Cj+ZBJpLD9fA1cfx0U8dHAS4IcCiMYcs/LTtB/Cbf3iMYro28rLOs9uZ0yOcfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AHWdkaKn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AHWdkaKn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so435955e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792163189; x=1792767989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+UMNkw96yis4TylIzTg/J00fj1/maNd71aDFIK6w5oo=;
        b=AHWdkaKn8zgUXck5RLwGvoNI7Gjf25bygccOcjydHZ7JajnMmBcxvLZbg4hNpvOBCr
         fj3Uc6aUqQIshK7uIYMhb0mCXil31/es/SmbN7Su977GgXfbEIPYC7PkrDyOIDQRf+m0
         B1DI25ZRgMhDrmAJ/c9k1rJCRtrqoIG1WIO4EdYHEjMndvYQ2np6zpweCUZufx1dxY6K
         x0ep8FfpUnvHCzJ5zOYh8Gcj+gXRud7IPNock3fZrDwbPg3/W2nCvepmVJMo//BRfugJ
         sE2AdvWDcszIyd+1XJqKNHxtlCsQGjaNi/MhKzLQagZwJ7FEx+YvRVAWB9C/XkPGH2ef
         Z1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163189; x=1792767989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+UMNkw96yis4TylIzTg/J00fj1/maNd71aDFIK6w5oo=;
        b=kQPOV1Y71Oy1DpQi/hx6SWjnnevZltxeXfgDuEOl4nR0N+s6EakcxSzBXsPVmgrILU
         UKLlkk/RkPhpgo3O3XJA308HlOJxe4P1upT1kZmAm+DIB2L7MtDKsldImcfAkmGyqxm5
         J0CRII/SR7FAVF59V54R+Dgi15bIILQ7R3Dp45TAV6mtBzA/DZgfRb4x8pZXPtv30j+P
         UlAq7DXg6ilS4gueFtgPHTeRtINJwSKQ76v3qU/NLVEqrcM0RVb+0vepSe1bitOUzksN
         q8lSJLe/eDpEQmA9G5EvTWQOY4k6WmHHsqOL6SD6C/KGwIUbIT7OqPuXbcZ8A4aDXwYq
         dSaA==
X-Forwarded-Encrypted: i=1; AKwUvByUVQpxvwxy7q9WoL5jAKgzDT5U7C2aMHDF8O4EASw0rghZ6uqXQhLY+SBUKkziEo/cDDNgUbqgKysR+cg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSM9+q5+6g9PYnV8Z8FA/i2YBElzfWZvk0Ub0rl/Gy7JJkJIMV
	66V5I3BrPCQzO0slDEsU7ZZ5fl6e2dco1aMI2pt/ZUpN8FApTDWZAKIL7gFqMk5auAc=
X-Gm-Gg: AYBFou2OYox2YBGDw6+YPkSDRw+9A9JVLmxjJgIb+vbyiefnP5iL8rp66ez3SHpB8lG
	OKBNPV4KlZKU5517/s7PkanfPTY7gfyYlhRdCL8Ib6fEOgtrbRRj+dK1FqQVluIiw9d8RafYwTt
	/Vgj/5MEywqKYD8inF7aAQKIL1ehXQo5Qo0Xs9EJ5EH7Lv8/5AQfYgR6QNR5i3gtg7kyqtGjM6F
	Z65jjwn375mjPYjmx0v6+Q+/4aAkTLCNkaonjCD+sQ4ncYZ+/S2+oalMuLH4W956ejDJan3NBOn
	BmfkUNeRoaKm/3fJK1ji43wRMnhM/Gt39GCFsvW60bTWLJs53VFN1/w/ClPUSs3wFPZ4UFFHGOE
	H0aeDKTfvwttH4gahTv358jemrgyBYbB6n/wjiynsnyQnwYo7jfFTuu4DE2snchKC9epj/XP8WK
	g1HwfX46qclNVNJUldO5hVgJEv1tSrG5Sq5ZYGuYMrxg1NXYyeZ8M8V6qUJCznQmeAgq0cbGety
	3FeiYW55y0=
X-Received: by 2002:a05:600c:1d05:b0:4a1:bd69:526f with SMTP id 5b1f17b1804b1-4a1d75ab235mr2608255e9.4.1792163189350;
        Fri, 16 Oct 2026 08:06:29 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d0e2bb8dsm39948365e9.2.2026.10.16.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:06:28 -0700 (PDT)
Date: Fri, 16 Oct 2026 17:06:27 +0200
From: Petr Mladek <pmladek@suse.com>
To: Derek Barbosa <debarbos@redhat.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk v2] printk: Postpone kthread startup
Message-ID: <atI9c_kFhntodl68@pathway.suse.cz>
References: <20261016085441.857695-1-john.ogness@linutronix.de>
 <atIndeV-NzO0eIz2@debarbos-thinkpadt14gen5.rmtusma.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atIndeV-NzO0eIz2@debarbos-thinkpadt14gen5.rmtusma.csb>

On Fri 2026-10-16 09:36:41, Derek Barbosa wrote:
> On Fri, Oct 16, 2026 at 11:00:34AM +0206, John Ogness wrote:
> > There have been various bug reports related to SMP systems hanging
> > on boot. The reports vary but seem to have some overlap with regard
> > to missed IPI's during SMP setup. The reports also show that
> > reverting NBCON console usage allows the bugs to disappear.
> > 
> > The NBCON kthreads for console printing are started very early
> > during boot using early_initcall(). Since these kthreads are
> > asynchronously enabling/disabling interrupts during early boot, they
> > may be interfering with early SMP setup on some hardware platforms.
> > 
> > Starting the console printing kthreads later has shown to avoid the
> > hanging on systems that could previously reproduce the issue.
> > 
> > Postpone kthread starting until after all arch initcalls have
> > completed.
> > 
> > Reported-by: Derek Barbosa <debarbos@redhat.com>
> > Closes: https://lore.kernel.org/linux-rt-users/arPmYPbFLf2EldIl@debarbos-thinkpadt14gen5.rmtusma.csb
> > Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> > Signed-off-by: John Ogness <john.ogness@linutronix.de>
> > ---
> >  v1: https://lore.kernel.org/lkml/87ecdrqfhw.fsf@jogness.linutronix.de
> > 
> >  changes since v1:
> >  - Reword commit message.
> >  - Rebase from 6.6-rt to 7.3-rc.
> > 
> >  kernel/printk/printk.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 0ed86b5e8b160..9a205f94bfac7 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -3864,7 +3864,7 @@ static int __init printk_set_kthreads_ready(void)
> >  
> >  	return 0;
> >  }
> > -early_initcall(printk_set_kthreads_ready);
> > +subsys_initcall(printk_set_kthreads_ready);
> >  #endif /* CONFIG_PRINTK */
> >  
> >  static int __read_mostly keep_bootcon;
> > 
> > base-commit: 38dfd607b58b63b5488d5756786ee4ee499eebb8
> > -- 
> > 2.47.3
> > 
> 
> In the v1 thread, I mentioned that I would leave the reproducer spinning in the
> test environment for a few more hours. It has been well over 9 hours. No signs
> of the existing issue popping up.
> 
> Tested-by: Derek Barbosa <debarbos@redhat.com>

Thanks a lot for testing this. It is good to know that it helped.

I am a bit nervous that we do not know what is the culprit.
For example, I wonder if the same problem might happen during
CPU hot-plug at runtime.

Anyway, I had a brain storming session with John and we were not able
to find any hole in the nbcon API design. We did not find any location
where it could cause deadlock. All busy loops are under
con->device_lock(), aka port->lock. And the port lock is taken with
IRQs disabled. And neither the con->device_lock() nor the busy loop
is done in NMI.

So, this rather looks like an existing problem. And the parallel
handling of the serial console just made it more likely to happen.

The converted uart 8250 is being used on many production systems
which are running the RT kernel and got this change from the external
RT patchset. And I have heard about this problem for the first time just
a few weeks ago. This makes me believe that it affects only small
amount of HW.

This change clearly helped. Which makes me even more confident
that we could keep the uart 8250 driver converted in 7.3.
I am going to commit this patch and create a pull request...

Best Regards,
Petr
