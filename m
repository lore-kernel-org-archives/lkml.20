Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499340;
	b=slb8+obfqy99AEkQiCy+j7/MZaybJl4ZsSU2K9SkZyoaTjTBWiUFG+GvOw1m9NHYhWHX
	 6wDFhUAwucopl2feIAqSrKWp6VlanLvjwFt9F2KjUlBv0tKJL6Mw38nAMfgFqtD7ImV/0
	 PJLT+j3hbtXvRVhBwGgFdc3JYs0QMManxe6oRVwN8yeD1mMgXUG2mRqVqWU1XSLPHIhHN
	 OVMXLL9EK9+OztSkO+dzfFDzWEpbPoNaZBBsRuBLG7WxSHAM8marLlif9KJy0Rz3A6iG7
	 FG2vEKWvSyzK6nogrB8azXZwkJxnc0qIXyqWV8PwFp4FKc5kSA8nr+oDBkJiKTkLcMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lfZbqFmLr8Q6MECdNX562ifwqH83lxZBW8nCUfGoGTs=;
	b=hYCbKc5oqY6H6mBPY9tBuyJue5fRa1aqENjA9IFt82L5TyZ+bSsRQSEdRSmHU1YXg06x
	 Y5oXHZ6C3ifJQnPAm6DoNQ2PkJieASq58Q/FmLId9ktuukWsRa4KO1JQVnoSCaCxnFJnf
	 ht7mBqQxIgluKZR+U+cwiMNOBhvatMciH++KsHiXlJ/TGouySjINZGdFsfRRmnwcEVjEG
	 C63nbIizz7ECjMT5sRbWYvZVBmhoVFsJLHu5LLrzsDX98iFjf5/jxnuPx3XzZBQg6g+W6
	 0zBWduOf9KpU/+JG/su3SWs5smPJj1goOm11ge9ufcDDYEErPb5wRFt+7XzWOX4IM1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="N6/XTZC1";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F80606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F80606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=N6/XTZC1
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2259110f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792499338; x=1793104138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lfZbqFmLr8Q6MECdNX562ifwqH83lxZBW8nCUfGoGTs=;
        b=N6/XTZC1nghPVLJWcx1jJKYR4/4ERrwB29Br8hBD6S6stsVkyggKbfiq5fzNXL0Ppa
         CpU5KUKmPjnpFpMbUt+w1NE/dR0xBhSLkoiEJUb8HbxJpF16pLYMJFzX4LZczorpoYDL
         tpWtXbrLIlLKnn+kut1zfc0Zvxe0vcdJhaSEnPgwC3UywPI7qKVSYwJwDJ1nYraXTk87
         xH4nt1vtE5uwMdNG/3RcqX25B/npAZxPRJyZXTpZryF+VdoS8Kaw+K+l/tJaKRJOage0
         UlXTfArrgqnCVZ89FPaeaQ8XanGPj7Wli8RNgRb/39LwAyz4fj5NCWP4ArMwt/WiJD2X
         8RRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499338; x=1793104138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lfZbqFmLr8Q6MECdNX562ifwqH83lxZBW8nCUfGoGTs=;
        b=R+UQRXX8FmF8pkjiw+Wuqt880BlWYkuUSmdInzj7byIkEgCZ5ASmnp1/6tdGd5MfKZ
         HQ44lh2rDyOwoZyTweCvAxsIMpWGE5fKQVpRI+/5RVWPPyBcfRP5Q8cp4N7I4mxW0uHn
         u1MBYEGfBJM5odsYX+Lxd/1wknWkTNMMHRCRA24/O7qsGtTjyPVO5Ex8x8Q/iPI82Aoi
         bPtEtZ58CJ2cP1qWO1fJ/J+X5xxtifgu3sxsgCA90SzvG+6QG5NNsPh7vWWlgYeVehro
         4LsMPCqoFEsrQdBOT5Jo3tXZpTkxn9nchqVZ4cmPluZX2EEa+wNPTNV2BIZuydwt3li5
         oQmg==
X-Forwarded-Encrypted: i=1; AKwUvBzd3SRb+mnB8W8rjwkyEV5w2bS3SNPNxM9wbPGXNjMRWbfXerXcwgzEv6BEKF8GNglFFeniV11108o0x/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Fa3cmT6eJM7bbqUq7Vt2+TTwb9Fsf1x7l/y7jkr4Jur3waS+
	LPt9k2tb311DVg+imRjnLecyZV7UIZ5h1uYDfc1fRZK5/f1Q5pY6mau1kcmbCyC75VA=
X-Gm-Gg: AYBFou0Q0npuIbUuhrh3byUYQPas6h4EoW28ZVn8Uca0XvTTA83tZulYyWedBs6bUbo
	zJyM+9gYKoHBNd3JwURgkBIOwW/pRXlrMuojHzlDylhRGZgPdxX8XsMCblLXTgiMkNR5gZzJqeY
	EVy3ELIJwEtnUNZh2/jmAHbZ6jXCxPPX7Ysp+di4xhQ9+GuNbXt8IglZg4CbkjktEj/Sy2PlqRi
	HMvlqsI5sVYIJiDStZYaC+AWQ4UM+sAGyhifXbU9bgJEXVpUk2oQpozQxuTMHtp1AtcRhxwja9C
	vtzUBa7w3wgifKySCUFR/pbFqpTYxUq8eZfkreRbRpZ0N/xnofc9FhDWYCy3yhX8TU/Z3DuokT6
	q+QPxs02X/7TyQsOeJ5JD1P9PLLkBgJKN0H+/QYqs4lJTMIuZwBKGbFzghgZtTP96AvdIAqVoW/
	jxZjLrRjQqEt7c+WN4HBIYTaO9Yxcdkcz7B5+zsAYRfaDvV2fdYxblYm9PMRM/KZiooLKW+OB2i
	7+vceuM3Uk=
X-Received: by 2002:a05:6000:4694:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-48e07f9c387mr16153415f8f.40.1792499337854;
        Tue, 20 Oct 2026 05:28:57 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbd33sm5588977f8f.8.2026.10.20.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:28:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:28:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>, Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2 3/6] panic: Allow postponing pre-kdump notifiers
Message-ID: <atdee9q7DExYLGPE@pathway.suse.cz>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
 <52183acf25209275a9a57fe5d746f82d3b7efc3c.1790014793.git.zack.rusin@broadcom.com>
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
In-Reply-To: <52183acf25209275a9a57fe5d746f82d3b7efc3c.1790014793.git.zack.rusin@broadcom.com>

On Mon 2026-09-28 13:55:37, Zack Rusin wrote:
> Provide an escape hatch for debugging kdump failures that may involve
> pre-kdump callbacks. Add panic_pre_kdump_postpone to skip their early
> invocation in crash core without consuming the once-only guard.
> 
> When enabled, the chain runs before kdump only when
> crash_kexec_post_notifiers is also enabled. Leave the late panic call
> unchanged so callbacks remain eligible if that path is reached.
> Skipping the callbacks may prevent hypervisor crash handling.
> 
> Suggested-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> Link: https://lore.kernel.org/r/bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
> New in v2: optional postponement policy suggested by Guilherme.
> 
>  Documentation/admin-guide/kernel-parameters.txt | 14 ++++++++++++++
>  include/linux/panic_notifier.h                  |  1 +
>  kernel/crash_core.c                             |  3 ++-
>  kernel/panic.c                                  |  2 ++
>  4 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 33cd30996e47..3d722df30838 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4904,6 +4904,20 @@ Kernel parameters
>  			This option should only be used for systems with the above
>  			constraints as it might cause the panic operation to be less reliable.
>  
> +	panic_pre_kdump_postpone=
> +			[KNL] Defer pre-kdump notifiers to the late panic path.
> +			They run before kdump only when
> +			crash_kexec_post_notifiers is also enabled. If panic
> +			reaches the late path without entering kdump, they
> +			can still run there.
> +			Intended for debugging kexec/crash-dump failures.
> +			Skipping these callbacks may prevent correct crash
> +			handling by the hypervisor.
> +			Format: <bool>
> +			Default: 0
> +			Writable at runtime via
> +			/sys/module/kernel/parameters/panic_pre_kdump_postpone.
> +
>  	panic_print=	Bitmask for printing system info when panic happens.
>  			User can chose combination of the following bits:
>  
> diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> index 3ad390764a41..655ee5c77181 100644
> --- a/include/linux/panic_notifier.h
> +++ b/include/linux/panic_notifier.h
> @@ -11,5 +11,6 @@ extern struct atomic_notifier_head panic_pre_kdump_list;
>  void panic_notify_pre_kdump(char *msg);
>  
>  extern bool crash_kexec_post_notifiers;
> +extern bool panic_pre_kdump_postpone;
>  
>  #endif	/* _LINUX_PANIC_NOTIFIERS_H */
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 5d9fe9e00f39..d6b2293dd0fe 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -140,7 +140,8 @@ void __noclone __crash_kexec(struct pt_regs *regs)
>  			struct pt_regs fixed_regs;
>  
>  			crash_setup_regs(&fixed_regs, regs);
> -			panic_notify_pre_kdump(NULL);
> +			if (!READ_ONCE(panic_pre_kdump_postpone))
> +				panic_notify_pre_kdump(NULL);

Honestly, it looks a bit confusing to me.

The name "postpone" suggests that they will be called later.
But they likely will never be called because the crash kernel
will take over the control and eventually reboot the system.
The panic() path will never run.

Also there is:

void oops_end(unsigned long flags, struct pt_regs *regs, int signr)
{
	if (regs && kexec_should_crash(current))
		crash_kexec(regs);

where

int kexec_should_crash(struct task_struct *p)
{
	/*
	 * If crash_kexec_post_notifiers is enabled, don't run
	 * crash_kexec() here yet, which must be run after panic
	 * notifiers in panic().
	 */
	if (crash_kexec_post_notifiers)
		return 0;

So, when: "crash_kexec_post_notifiers == true" then
kexec_should_crash() returns "0" then
crash_exec() is not called. The system might still
call panic() but remember "crash_kexec_post_notifiers == true"
so the notifiers are called before __crash_kexec().
So panic_notify_pre_kdump() will still get called
before __crash_exec().

Is this intended, please?
What is use case, please?

Maybe, it would make sense to add "panic_pre_kdump_disable"
which would completely disable the notifiers when they cause
problems.

Best Regards,
Petr
