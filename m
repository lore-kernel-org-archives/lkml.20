Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964842;
	b=C7fTtam/72IH6secdsT/0iOXNHfiEU8QkluRdI5IFcQD+TdN0zCSJl21WmyEytIfVzhS
	 pmoSitbzMRlCZEBx3nQnoRa8vOEFv+GcwHkCrHLIOCWxlH8ctVoNMvT6EBls+2HkeV0Qo
	 PkSkiQFuGrLDJGkfAYpg+QsfAy8J3x9VD8WBOdCWvHN4d/RrTNdEnITfGIjsXZl2zty8I
	 sFZqztKG1sMQaQbl8W/KUTiZonThf0trrwA7R6MoOcFDTEJUYKkeAy88ZTUXp7lymBKoD
	 ie4V4jTDXMWpDwYLAzZfHIwkOMA0mZowxOoyl54AzyuQq/gXpBXO/HPno1QC7kKQsXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=OxMB+gkBGHFqPVWcpPwo6+5z8WE1LmmBlLMI04+mu9s=;
	b=NDuz+4EpQgmuLHR9aiTCzTXaTKLrus5bT+7qyhHpJb2SlTN2b+3+Ni0a4vr945rYlo8O
	 Oth2X1miynziHljWbDDMSbXu5UtD6O2/VowTk/IIrmtbLohNR+PRdiRqVqVLIMfy3Z0ac
	 QVW1JvJ8Xezkz8187CIwIfGo6H9UJYQIl0CfK9+QEmoMLaeNPWk2bfv84l9otMmZFQSdc
	 zZdV4cdUwqUEYRdx0H/KRVVnGNxLyH5rqWdUYrJMSlRMzLrriqqAUWkbAAvmdL4GEgd7V
	 7SLL2Y4w27NXuBf2TVVyTks3gBgd4hzv3c/isP9ROA1VVqsQ9YdkWASiVdRgV6/hgWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PT5aRGXe;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7C606D806
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B7C606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PT5aRGXe
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so3715005e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793964840; x=1794569640; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxMB+gkBGHFqPVWcpPwo6+5z8WE1LmmBlLMI04+mu9s=;
        b=PT5aRGXeo0cVaEn4sKPthzZYZTeLLVmhQ2h6V0DdbsK4IOTOcTLB3I/UQQrL2I7YMA
         hCf3HtNUx7L1/8C9GWCUgczHKjoCPdCEEH8/wjmL6EEE6y4wTMv2pzCDg3GVuh4J1z6O
         e0G2c8S4jWU1uJGVgwYzR5PAbcxP6+Y1XsS8YLm0atxfINqzbgBWQ1PhwRfdQXhNXtdT
         V7jkeYdYdFJV33MoDvdCkFn7b4MT60hG4WKP0NYhD4nYw6OoWWRK26CbJNh8H7OrX/f+
         AdOWcoHB4DTgZF9GyEU05E760f5RgvgOqrnFtP3aJLsHmA571Ymf6mvZftYGvvCukIKx
         YdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964840; x=1794569640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OxMB+gkBGHFqPVWcpPwo6+5z8WE1LmmBlLMI04+mu9s=;
        b=AGfO//c3A5B/Gyt2yBZfg4xxmxHn/MbSg8aqgipnbDT+be7uZyly+7jlsgruiUfBuu
         UPWW4ww/9SAqO84GijQm7zdTPu3cFGzDz6duh7klR+JqQ/7vhqczP2qvDFGixl9nsBBn
         BGbKLR1wvbg8BTtTG+ZJX6FZh7JlOQEqf+JAzdDq15FnDD0gSL6Ene2vj8E+KBGb3XT/
         XWrnbBpqRimIxrf1xRPYjt3z53iPYBFF/0MLBdwdij6HjOUjTtfF9l1wJFP8UMnG4mVo
         7mBsC0wneY5YPHHLv+2qM0oZJWJaNd3tP1vMKisZjDflR3x+3Qcelt+ujjmmYb9rY5dO
         W15Q==
X-Forwarded-Encrypted: i=1; AKwUvByTrMYW8pkZ32KYfvy0mls0eCBcVdjHAvSV5GF366PVhga+Dpnnq8k45NDhEpAkTJEKBF6IU+lu38Y0Ack=@vger.kernel.org
X-Gm-Message-State: APuU4Z+13vJiZwKb67k2WFbpcQSfZfVfblXvck6ClVE/WuLfoHLoytkv
	FMgVmgwx2W/3qcwphqn6QI1dGBfGPKKsYOs20tQyFDdZRRJ6kZBCwckRdcrgPe6wI/HnbhLMYZM
	OsleqTg0=
X-Gm-Gg: AYBFou2DLW1krImF4qVo2Z4SKjU5NFja/gzNyoVALrVDXxqE85RnSr/G74CiEgt0RYM
	snIyYt/Kh+Ljo6ZW0iN+uKtg/0MWW6dzM3xEQcBf+GtOL6z1MXogbe/2Kf/Fy4xbvJOfH1irEbn
	ncSllCsEBRJSb7ORnYXSn2d23KJ59Y3YkmogqGkEkdEl9dl3BoKrEp/xsVW+zL+5tnDwec0Ew4H
	KsB1Am/+ySCTGd9he5/MbxSS/K4TMg6exyT267i0/gvOPWs0VU+zGrnl3FWSyVNy8+AQxGbPAzc
	vCxh3ZHnDHm/wkL87H7lvCAc3xptxn+ZTP0BD7ChRkL59mHI/6MaI9+SlxFpjDUgSc4yN1/qrf4
	F+6CyC5LB9FKSoFQtd5rmxM3/m8LKfS5R93KhAF1F/C9NcF0BbUpmNYQhoPDVDi4I2ZAtXlBjhK
	uAGczk8KjhcX+LBRWOvwec4qPPPGHlPHqGXpcKIWOMvjmL6bl0+m+FiGavL2Yei+i94R6b3EahL
	QcjwwoVDzRXRcJC+JbUFfNsEvpyV4707+XnFUKBTcp03D/8Z7s2veJ1XG9VVmtYIMFEis8tsBOP
	5GL5/5+T1B0CYqXa3Z6dh0qh4R5wFw==
X-Received: by 2002:a05:600c:5285:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4b6de4a6f90mr36210385e9.10.1793964839622;
        Fri, 06 Nov 2026 03:33:59 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm242094515e9.2.2026.11.06.03.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:33:59 -0800 (PST)
Date: Fri, 6 Nov 2026 12:33:56 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/16] printk: Try to register each console as Braille
 first
Message-ID: <au27JKkPAnhj26jI@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-14-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929120546.328616-14-pmladek@suse.com>

On Tue 2026-09-29 14:05:43, Petr Mladek wrote:
> Braille consoles are unique: they can only be enabled via the command
> line and use the preferred console framework for initialization, yet
> they are never added to the console_list or associated with
> /dev/console. Because of this, the preferred_console variable remains
> unset when only a Braille console is requested.
> 
> Currently, try_enable_preferred_console() must be called even when
> "preferred_dev_console" variable is not set, just to catch these "hidden"
> Braille requests.
> 
> Refactor the logic by adding a parameter to try_enable_preferred_console()
> to explicitly handle Braille vs. non-Braille cases. It will eventually
> allow to skip try_enable_preferred_console() when there are no preferred
> consoles. This improves code robustness by ensuring the console
> setup is explicit and only performed once.
> 
> Note that _braille_register_console() is skipped when the given console
> driver has a match() callback and it succeeded. It means that it took
> over an early console and can't be used as a Braille console.
> 
> As a result try_enable_braille_console() might return success even
> when it did not enabled the console in the Braille mode. It is
> the reason why register_console() has to explicitly check whether
> CON_BRL flag was really set and could skip the further steps.
> 
> The refactoring even fixes two subtle bugs:
> 
> 1. When only the Braille console is defined on the command line,
>    the original code might attempt to enable the same console twice—once
>    as a default and once as a Braille console. This results in calling
>    the setup() callback twice and incorrectly setting the CON_CONSDEV flag.
> 
> 2. When the same console is defined on the command line using devname
>    and then as Braille console, for example:
> 
>       console=00:00:0.0,115200 console=brl,ttyS0,115200
> 
>    It would have two separate entries in preferred_consoles[] array.
> 
>    The 2nd (Braille) entry would be used when univ8250_console_init()
>    tries to register the generic "ttyS" console driver. Note that
>    the 1st entry still does not have defined the "name" entry at
>    this stage.
> 
>    The 1st non-Braille entry would be used later when serial8250_init()
>    registers all found devices, assigns "tty0" for the given "00:00:0.0"
>    devname and tries to register the same struct console once again.
> 
>    The original code would call newcon->setup() twice in this scenario.
>    It won't add the console into console_list only because the later
>    check in register_console() would detect CON_BRL flag set from
>    the 1st registration and return early.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3995,7 +4012,7 @@ static int try_enable_preferred_console(struct console *newcon,
>  			if (newcon->index < 0)
>  				newcon->index = pc->index;
>  
> -			if (is_braille_console_preferred(pc))
> +			if (try_only_braille)
>  				return _braille_register_console(newcon, pc);
>  
>  			err = console_call_setup(newcon, pc->options);

From Sashiko AI:

| Does returning 0 here for a Braille match cause the console to lose its
| preferred status?
| 
| When newcon->match() succeeds, the loop falls through to:
| 
|         newcon->flags |= CON_ENABLED;
|         if (i == preferred_dev_console)
|             newcon->flags |= CON_CONSDEV;
|         return 0;
| 
| When returning 0 here after a successful newcon->match() during the
| try_only_braille phase, CON_CONSDEV is not set because preferred_dev_console
| is never assigned to a Braille entry.

This works as expected. The CON_CONSDEV flag is set here only when
the related preferred_consoles[i] entry was the latest added/updated
entry for a non-Braille console.

Note that there are more situations when the `preferred_dev_console`
is not registered, for example, when there is a typo, or when
the related HW is not available.

For this situation, the CON_CONSDEV flag is always assigned to the
1st registered console driver, see the commit 33225d7b0ac990
("printk: Correctly set CON_CONSDEV even when preferred console
was not registered").

[ ... ]

> @@ -4033,6 +4061,24 @@ static int try_enable_console(struct console *newcon)
>  {
>  	int err;
>  
> +	/*
> +	 * First, try to enable the console driver as a Braille console.
> +	 * It would have metadata in the preferred_consoles[] array.
> +	 * But it won't be counted as @preferred_console because
> +	 * it does not get printk() messages and is not associated
> +	 * with /dev/console.
> +	 *
> +	 * Note that it might succeed also when the driver has a match()
> +	 * callback and it took over a boot console. In this case,
> +	 * the driver will continue working as a classic non-Braille
> +	 * console.
> +	 */
> +	if (want_braille_console) {
> +		err = try_enable_braille_console(newcon);
> +		if (err != -ENOENT)
> +			return err;
> +	}

Sashiko AI wrote:

| If the user specified both a regular console and a Braille console
| (e.g. console=ttyS0 console=brl,uart,...), does this early return preempt
| the regular console entry from being evaluated?
| 
| If a driver matches the Braille entry and returns 0 without setting
| CON_CONSDEV, returning early here means the regular preferred console entries
| are skipped. This seems to break /dev/console routing, as the expected
| primary console never receives CON_CONSDEV.

The problem with CON_CONSDEV is basically the same as above.

But there is another interesting question whether the console driver
can be used as a classic printk console even it could not get enabled
as a Braille console. I mean whether, for example,
try_enable_default_console(newcon) would fail when
try_enable_braille_console(newcon) failed.

I could imagine that the driver might be usable and only the
VT integration failed. But the VT integration never fails,
see braille_register_console().

Also I think that we do not want to use this driver as a normal
console when it was configured to be used by the Braille console.

Best Regards,
Petr
