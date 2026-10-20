Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484239;
	b=lKYZXOurA0dUPz6txP6pwvXzQpxSGnhPbNoVQAJoPbSgLnZZ+ZqMf2Y3x/Q7ZCXZCGfQ
	 ujmJ+GzOP/sm3Z/3pmmskmBBQQqyiKp1ptSWIc42InSCl/nkbwoYFVcPrRD9jLFBs7fHv
	 15vUF4Tg41Fj/8LLoxNi+6BeL5g+51J3pB76ypsDSHOevhVYnroU2rIBN1ON/jlf5S+UG
	 Y4EviPm3qliMX2+2ivB+53422Ct7D1tZWzwyPbzj3IsZvOfm9D9CRxvNtzqOBNN7NKx0l
	 gJR27uXc7kK8JxkI37Kcccc9TTzog+gQXDoNjW59+NyxuuGMnFix6u0pRoOP8TloZZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mWAuZEoa06/FId6EaCbOOGJEvcdb/dADU57niR/UVVQ=;
	b=4snROKJ3k28yj607HVgX+T2XA11lpBluxgkuZTBw6MHlOoxNGEHjtMTyl21WAvVO3n7t
	 30zKarVQnWMHv4DMO+oABQE9UJHCFs4YGN925AsDWu0UxqC2iHJyv9SDPMGKQSGMZEEl7
	 v6hGV0tfvT58uLfgHbwGZSKcPwcWzTvfh0LS9QDXYJALhwqV961JxoLR2RUNFMGcNYuy6
	 cvSf4JA1czbvgzwaSY/PjCWKCOOaAOBC7WPhFZjBt94hR/Anqbo/YlWqOrchr2hmkpJWh
	 48/wrX3RH2hAYrFFsugtRoYp547qeMMs0w3m2UU2dYVR1e+XTiIHdreqOKsL5+MA9fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7E1606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F7E1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1576440f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792484232; x=1793089032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mWAuZEoa06/FId6EaCbOOGJEvcdb/dADU57niR/UVVQ=;
        b=eqbh+v9rTkN8cPbfFqLadpcRF5O3zsVKhBYKXbqKw8bfyfFG/VxWCVihbRRrcX27wa
         mvhc6KpaN5L/Ia0xMT55R8PKgMY8pzcfkzJlMmBZvY5KxctYiJ+44qqNM+A7CPV3yBZG
         A11OxqWdBqvpbvn9CCEYEmlfQICOwWYQ8Toibf1FdoE3vcBKq7RU2whROqNJNVEIiGE6
         Ia3/BhRJ/V5SNrejO3ayD9N8jMthCUe5EcYZEsaSA8j08+L3usCSvczrVi7gODnYzFUW
         q3y0guQYogKNB6UuYLh+sxUOqz5DE5p5GyI7UMCbzntIvUs4nge2rPbgyyoQ5zH4RAQ6
         Ac/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484232; x=1793089032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWAuZEoa06/FId6EaCbOOGJEvcdb/dADU57niR/UVVQ=;
        b=ZQ8MP2QPX1/KZ7oZMP+TEM262Efupa3vy4lN7CJSSZ6b/P66WOMQTsoPlR5QoNAXpk
         T20kwHGeo0BhtKGp2Nhs97U5eaO299NXt1hQjwhPBF4Tsy8z4t6A+8RSZke458+4meYe
         sd7bEN5ebMveZH67NU234e9asIMtpGfWSX5rmeK0g5aPcUziqs/cW1EyUJjXzIgvjnx2
         F62NRijd/S4+KQeYUOlaumXVHBY+uYLlRGwG8i5e8uBuG2A7Ey+qcDlgBicgDjI4HjPD
         HlUX7iAI/zA83fL5+HsGRsQqeaKxKo79gnt1Gc4TDDxKyITV+1TTq1mPyRm/5Y8xLYYD
         1owQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMSpxTIsrCMZ8HoEoXwFrhEYZFIrOGBtmmBRnbbcx0M7yNIBXkDvVv/NhEZykK+kAN/9Mz3PjtZJ3JSnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJohF2LV0HLbBBQHaJi9N7q1X/SDMRuvfW44ZtarkExW/atgFmD
	zzZENoAYI9YsrajGYfUmImspTQxEaOpMgCjl77+XTkEZUlZKSMt1QkRZEvSzANyCCfM=
X-Gm-Gg: AYBFou3rA1CTRRqAXzzHzX4k/AtsCmLyctZO1nClRiudexnzSeqSwmOsyE7YORjdedp
	4+nB4u8k7YPPmwQy1o8Ut+ShTxoJTbaU4P+FtjRdD7Y5Uj5PziOWc4JLKvFoQuxnUjA8omvmLcx
	I8e7BL/+ByYFyljZadqP9rEsPCnHrxCgTPaf8ivVCWdYvMegL9hQmhDAL8k+saxkWDUAP+uo666
	vVK5Zw+pjmPzkF0fdxBbqSC+/r4GRVaQlGN7KwMnaKTkZzwFJsHwISQocZjFGuGfqQYyfiztbPB
	lmQo1Mk8lACfg6ooVPMSPNwC8U1BAq1HH9L69yK1fjdcReSGLYBhYnuOgFVJIuhfc82atvoHGQh
	HJ70uj7qJwsPOyYZqnk0raixdfsJNMWSu8Fgn/6pj83cqOtEhetM4royIukW1avFyEo4962mrV3
	xrhgoYvegXS6lJcJaBXIV/xYgLbmJNcWG9TNfkxgv1aFwV0+SLLcCc4zA0Hr0zB5k6AGjT0QTm
X-Received: by 2002:adf:f806:0:b0:48d:f99d:a0cf with SMTP id ffacd0b85a97d-48e07bbe7b8mr14525572f8f.16.1792484232267;
        Tue, 20 Oct 2026 01:17:12 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbd43sm3653817f8f.4.2026.10.20.01.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:17:11 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:17:09 +0200
From: Petr Mladek <pmladek@suse.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
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
	kexec@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 4/4] x86/vmware: Run panic diagnostics before kdump by
 default
Message-ID: <atcjhe4329sYHWvZ@pathway.suse.cz>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
 <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>
 <aquttpMVKX8e6zGB@pathway.suse.cz>
 <CABQX2QPJVg-dZB9f4ydRU_5W7nyWwVCQtDoRGoe1+9cA7wyUDw@mail.gmail.com>
 <bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com>
 <87v77p9t4h.fsf@oracle.com>
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
In-Reply-To: <87v77p9t4h.fsf@oracle.com>

On Mon 2026-09-28 10:35:10, Stephen Brennan wrote:
> "Guilherme G. Piccoli" <gpiccoli@igalia.com> writes:
> > This Message Is From an External Sender 
> > This message came from outside your organization. 
> > Report Suspicious 
> >  
> > Hi Petr, Zack - thanks for CCing me!
> > Some comments below:
> >
> >
> > On 18/09/2026 00:23, Zack Rusin wrote:
> >>> [...]
> >>> Maybe, we should start with something simple, and introduce
> >>> one more panic notifier as a start. It might be called either:
> >>>
> >>>   + "panic_hypervisor_list" because "crash_kexec_post_notifiers = true"
> >>>     seems to be primary set on hypervisors.
> >>>
> >>> But I would rather make it more generic and call it
> >>>
> >>>   + panic_pre_crash_kexec or panic_pre_kdump because there might be
> >>>     more notifiers which are either 100% safe and useful or are worth
> >>>     the risk before calling crash dump.
> >>>
> >>> We could put there x86/vmware notifiers as a start. And we could later
> >>> move there other important notifiers.
> >>>
> >>> How does that sound, please?
> >> 
> >
> > It's a good idea, IMO. We could start with this, Zach commented some
> > implementation details below...and after it gets merged, we could move
> > other hypervisors that currently set "crash_kexec_post_notifiers" to
> > this list and eventually, unexport this symbol. We should avoid having
> > code forcing this parameter, as Petr said, many notifiers are executed
> > if that is set.
> >
> > (I'm CCing Stephen Brennan here, I recall he had problems with this
> > being auto-set, we talked about that in the panic notifiers big
> > discussions in the past heh)
> 
> Hi Guilherme, thanks for CCing me! You're right, I'm interested too :D
> Your email arrived on the first day of my vacation, so I'm sorry for the
> delayed response.
> 
> I like the above idea, starting simple with a second list for the
> notifiers which are straightforward and have an urgent need to run.
> 
> My previous complaints were with code overriding
> crash_kexec_post_notifiers, because that really interferes with your
> mental model when debugging panic/kdump issues. Having two notifier
> lists is a reasonable mental model, or at least more understandable than
> silently and unconditionally modifying crash_kexec_post_notifiers.
> 
> I like the name "panic_pre_kdump" for my own tastes, though n==1 on
> that.
> 
> I do think we're going to have trouble articulating exactly what are the
> criteria for a "pre_kdump" notifier vs a "panic" notifier? Anyone
> submitting a patch believes their notifier is important, so of course
> they believe it belongs on the pre_kdump list! How will we draw the line
> in the future?
> 
> - Is it safety? As in "the notifier doesn't take any locks"? I feel
>   this should be part of the criteria. (Though I have never been
>   successful in predicting what code would cause a kdump/panic failure)
> - Is it urgency? As in "without this, the expected behavior of the
>   system during a panic will not occur".
> - Is it the fact that the notifier is communicating with the hypervisor?
> 
> >From my perspective: informing the hypervisor of a panic is both safe
> and urgent. If the hypervisor is configured to immediately halt and do
> its own panic handling, great.
> 
> Providing the last 4KB of logs seems less safe and less urgent (though
> obviously still immensely helpful). The kernel provides a huge variety
> of consoles through which the hypervisor could have already received
> these logs. If the system is configured not to use them... it seems the
> tradeoff to not be debuggable has already been made :P
> To me, that logic belongs in a standard panic notifier.
> 
> Plenty of people will likely disagree with me on that, but that's why it
> would be helpful to have clarity on what separates pre_kdump from
> standard panic notifiers.

The rule of thumb might be. If you think about setting

      "crash_kexec_post_notifiers = true"

because the notifier is required for a successful boot of the
crash kernel or successful reboot after the crash dump. Then
put it into "panic_pre_kdump" notifier list and keep
crash_kexec_post_notifiers disabled by default. Otherwise,
put the notifier into the normal "panic_notifier_list".

I agree that people might still want to cheat and put their pet
into the pre_kdump list even when it is not strictly needed.
This is why my original proposal suggested 4 lists. But
maybe 3 list might be enough:

  + panic_pre_kdump_notifier_list: for the "must-to-have" stuff.
	 It ideally should be 100% safe.

  + panic_notifier_list_safe: for dumping extra information where
	the code is 100% safe (modulo bugs). It means no locks,
	no waiting, no blocking HW access, ...

  + panic_notifier_list_unsafe: for dumping extra information
	which is not 100% safe, aka using trylock, potentially
	dangerous HW manipulation, ...

By default, the first two "safe" lists would run before the kdump,
and the unsafe one would run after the kdump.

Does it make sense?

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
> Agreed for precisely the reason I said above: it's difficult to predict
> which notifier is going to cause a problem. Having an escape hatch to
> change this behavior without rebuilding a production kernel is critical,
> IMO.

I agree. People might want to "postpone" the "safe" notifiers
because they still might be risky.

But I think that they might rather want to "disable" the
"must-to-have" notifiers when they cause problems.

The naming "postpone_*_notifiers" or "disable_*_notifiers"
sounds reasonable to me.

BTW: I am always confused by the "crash_kexec_post_notifiers" name.
     It seems that my brain focuses on the word "post" and assumes
     that this delays the notifiers. Aka it makes them
     "post-notifiers" aka call them later. But it is the other way.
     I wonder if it is just me ;-)

Best Regards,
Petr

PS: I am sorry for the late reply. There are too many things going
on...
