Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB1445041C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979028; cv=none; b=E1O9YBtAvxssP9/Zos5vNX5Hdt1LLi19Kc7MRFCcb0M5OYq/0qCvi0nN/eRosBvd2azZLBeDcHdZDHQaZs2Jf6TBqI2rnBCeG7afXOkqYf3LDD8os5QEoGI1gr50ECkD7XG6xC3zavVgKl1ooHweRMyCWc5QH3jhscBgO1g7mPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979028; c=relaxed/simple;
	bh=xcjHNliDAAlJxE4i6y1GMT1/Vnv55RTh/tAGPwCPNZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfrJvmYagfdMOprqWrsdK/2tnurbJ124WEt8onExRY3auJvA+k5jhXbAOJrbcYsDobn4qrsqa8npQnMwD5PrbAZ9RrM4MQQJUz0D8Nphnk7rU3OGIzPc8+75bufnsiePBWTiCBkVvX5GnYidiBxtIgkwgerA3GiWKMIwb1hMbSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YWpyFxvt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YWpyFxvt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so26581455e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789979023; x=1790583823; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVkcwRd6JhJoKhW863CUio5f3wgxadePOqahgAJN2pE=;
        b=YWpyFxvt+sELjAun0bQuqBXm0ssS+SSbEx5MFDuBqjuD0DjG+FSBzgNpqc0rOVh4lv
         XWvkEDjHZgo/j1WVTz3/GofRm0W56ltr8/DHzjsGi+Abv7rEfyYHG1+IS/nYV+VIgbfQ
         awFclJA3unplq8WWbtMvEitZynvsYp+D/e3qiZZfCEMv2JE26HkeFQeGqDFOI0EdPb7f
         GbnQ/gEkac1JX3ghQqLOGdJPyBeJCgmdu5E4FD4vBrPsYPENvUuuoj3egc1QqcxVfeMu
         kTbncY3EspFn5ip0b1ZMW17KFC59RKG+9Tfraop8V0Ljk/B0FQoCL62oRsulLNJqGhMr
         HF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979023; x=1790583823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qVkcwRd6JhJoKhW863CUio5f3wgxadePOqahgAJN2pE=;
        b=k8Wm9i/rDnX9ZkeKFMrYz3w6rIByyNncSgRsba8Pn2xqpiPVn5PRGCS8UY8m+Hq86P
         gOXDQXbbeWWMQ3vimtscZaZGItoWo95xbWGzFGvj2UFHJtoCjuUi7+5b9FiL87uWtr1Q
         0n/5xkpGF35vCGM6GaeHOwBeAkjSkLplKnFPRsET1FmMEZxw8Zjd09lunv0rOHR9kD4E
         i31bW49j//PwUjiruwNI2huGP4ILcN62AibsFg6qbqehPDxH4kUBjc+k5ktTDfap8gjo
         2pJ8Z0Ezhou0mub2F8ecXn1duQYBc3kgbK+fMOszefYIH1cHToONQjoy6bybmKKe6GgO
         7LCg==
X-Forwarded-Encrypted: i=1; AKwUvByMIo8KkTc2hbSyFyKvLwrD/JzCQrach1mndPfz9f2bONKkJOWoGX/1CaRsXoZV+PFEJLEjLd2ot5k8Ovw=@vger.kernel.org
X-Gm-Message-State: AFuF++lmVZA9DeBJbiWqj1WWafO7HdSrerpB0wZRnTmazhR3Fvh/Bin2
	TfOoC4fr2Q2HuRQb294EcWvAP9BxWHxmlASmfqhOcJaOZOILfnP8br2EJSjipuZ/4iM=
X-Gm-Gg: AYBFou13r3kLdf5y/MN4K2HkI1Bn2n34EflRwUFWuzeScD5ycznpv/MUlfvIbKLMrQe
	AB2FTV2DQxYe+9tMWslnBtQRwwkpKOQwbb6QaopQBMRkDkpiAPggxfU6jli5DQQhIeTXn9DsVlb
	mXSEYp2ADZibABUjlT8TPK51Lqjyi3IZpgXygk4zsM/Eph9/2iQikQ5P6zJz9fF3SQN6/2e0CrB
	TlheRO/YzUbycKKg6wQ09hl18go+a2/NMUfGXq60Gv82Fy7lrsjYDcMn3S0H2vV2iVvRzrbH3AC
	z5hsHy94yB5YHY0OG93VPX6ZtvkHLj2RJ1DqnMZgNQBcYX2hUf7+50B+AUl20iw6va/G+KWKr8L
	Fiev4d1FWt6RyiXWoBn1e1OrTF51H7YCWtmemfQcm8L6gR3JUTC4jmle5gYDfOyUhmWxI+Z5hrN
	9txBlY8oTJGET7SBLWTH/VhPPjVZPlW6/xCFnQ3IyLapNir9J2c4MJIl3BsOwlRqM8EJ8iNxd80
	A==
X-Received: by 2002:a05:600c:4e14:b0:49e:7cfc:a9b7 with SMTP id 5b1f17b1804b1-49fc5735f17mr121597825e9.18.1789979023335;
        Mon, 21 Sep 2026 01:23:43 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm582435985e9.4.2026.09.21.01.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:23:42 -0700 (PDT)
Date: Mon, 21 Sep 2026 10:23:40 +0200
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: Re: [PATCH v1 4/4] x86/vmware: Run panic diagnostics before kdump by
 default
Message-ID: <arDpjCVbUFcdwq1A@pathway.suse.cz>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
 <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>
 <aquttpMVKX8e6zGB@pathway.suse.cz>
 <CABQX2QPJVg-dZB9f4ydRU_5W7nyWwVCQtDoRGoe1+9cA7wyUDw@mail.gmail.com>
 <bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com>
 <CABQX2QMDNHcKotEa_t9Y37L+uHhV-CfqSR2vcRpNT1c2O9C_2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABQX2QMDNHcKotEa_t9Y37L+uHhV-CfqSR2vcRpNT1c2O9C_2Q@mail.gmail.com>

On Fri 2026-09-18 19:00:13, Zack Rusin wrote:
> On Fri, Sep 18, 2026 at 10:26 AM Guilherme G. Piccoli
> <gpiccoli@igalia.com> wrote:
> >
> > Hi Petr, Zack - thanks for CCing me!
> > Some comments below:
> 
> Hi, Guilherme.
> 
> Thanks for looking at this and for adding Stephen. I'll keep you both copied.
> 
> > On 18/09/2026 00:23, Zack Rusin wrote:
> > >> [...]
> > >> Maybe, we should start with something simple, and introduce
> > >> one more panic notifier as a start. It might be called either:
> > >>
> > >>   + "panic_hypervisor_list" because "crash_kexec_post_notifiers = true"
> > >>     seems to be primary set on hypervisors.
> > >>
> > >> But I would rather make it more generic and call it
> > >>
> > >>   + panic_pre_crash_kexec or panic_pre_kdump because there might be
> > >>     more notifiers which are either 100% safe and useful or are worth
> > >>     the risk before calling crash dump.
> > >>
> > >> We could put there x86/vmware notifiers as a start. And we could later
> > >> move there other important notifiers.
> > >>
> > >> How does that sound, please?
> > >
> >
> > It's a good idea, IMO. We could start with this, Zach commented some
> > implementation details below...and after it gets merged, we could move
> > other hypervisors that currently set "crash_kexec_post_notifiers" to
> > this list and eventually, unexport this symbol. We should avoid having
> > code forcing this parameter, as Petr said, many notifiers are executed
> > if that is set.
> 
> Agreed. The v2 I'm working on drops VMware's assignment to
> crash_kexec_post_notifiers and leaves the existing setting unchanged.
> 
> > (I'm CCing Stephen Brennan here, I recall he had problems with this
> > being auto-set, we talked about that in the panic notifiers big
> > discussions in the past heh)
> >
> > The only thing I'd like to suggest: I think we should have a parameter
> > that disables running this list, which would be the opposite of
> > "crash_kexec_post_notifiers".
> >
> > I would implement it as something like: "postpone_pre_kexec_notifiers"
> > or something like that. The parameter would basically "move" this list
> > execution to the same time as the current notifiers, gating them to
> > "crash_kexec_post_notifiers". This way, we'd allow users to debug kexec
> > failures maybe related to the "early" notifiers. WDYT?
> 
> I'm happy to add that as a separate patch if Petr agrees. With it set,
> the new list would follow ordinary panic-notifier ordering relative to
> kdump: it would run before a successful transition only when
> crash_kexec_post_notifiers is also set. If panic reaches the late
> site, the list would remain eligible to run there. I'd keep that site
> after sys_info() and before the kmsg dumpers so the log includes the
> additional notifier and panic_print output available at that point.
> 
> I've called it panic_pre_kdump_postpone after the list, but I'm fine
> with whatever name you and Petr prefer.

I do not have strong opinion whether we need the new parameter. It is rather
a call for kexec/crash_dump maintainers.

But if we added it, we should make it clear that it is intended for
debugging of kexec/crash_dump failures. And that it might prevent
correct handling of the crash on hypervisors side.

> > > [...]
> > > I think that without that default though, x86 oops_end() can enter
> > > crash_kexec(regs) before reaching panic(), for example with
> > > panic_on_oops=1. To cover that path too, I'd call the chain from
> > > __crash_kexec() after the image check and register capture, under the
> > > existing kexec lock. A second call in vpanic(), immediately before
> > > kmsg_dump_desc(), would cover the fallback path. And I think a
> > > set-once guard would prevent duplicate or recursive dispatch.
> > >
> >
> > Regarding this, 2 things:
> >
> > a) I think you could change kexec_should_crash() to "return 0" also in
> > case the new list is set to run, the same is done currently for
> > "crash_kexec_post_notifiers". Makes sense?

Honestly, it does not make sense to me ;-) My understanding is
that the new list would allow to run kexec/crash_dump a safe
way under a hypervisor. So, it should be safe to do it
directly in oops_end().

> I'd prefer to leave kexec_should_crash() unchanged. The direct oops
> path supplies the exception registers to crash_kexec(regs), while
> routing it through panic() would capture later state instead. In my
> early v2 tests, the vmcores from the direct-oops path retain the
> original fault registers in the crash notes. Some crash callers, for
> example uv_nmi_kdump(), also bypass kexec_should_crash(). Calling the
> chain from __crash_kexec() after register capture covers those paths
> without changing their routing, and the shared once-only guard
> prevents duplicate or recursive dispatch.

Makes sense to me.

> > b) Well, does this whole panic diag thing you're implementing here aims
> > only at x86 guests ? Or would it be possible to run, for example, arm64
> > guests? Asking this because in x86 and some other architectures (but not
> > arm64[0]), it's possible to override machine_crash_shutdown() handler,
> > and run things prior to a kexec. Take a look on how Hyper-V does that on
> > arch/x86 - this could be just what you need, except if you plan to have
> > it for all architectures heh
> 
> I'd like to support arm64 guests in the near future, but I figured
> especially for review sake to limit our client in this series to x86.
> So I prefer the common chain Petr proposed: as the thread you linked
> shows, arm64 deliberately has no such override, and the chain gives
> other clients a place to migrate away from forcing
> crash_kexec_post_notifiers.

Sounds good to me. Let's start simple. ;-)

Best Regards,
Petr
