Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898819;
	b=klkSMGEJ9PdKkERLQzxdG3Tk05lBW0wWci7vq9LfDyTI8LLyAeHS1pjRQcuq0nQIgvde
	 0qwpFkNwUaLzfbirSmi6PnrXvshHkXtG4xV7xkhkV5AJi0JNjij6FNw0LK3s12xtdrBT6
	 F1KezKyOhNWvWnJvJA6rDuKkP967ij10XqUISIqqgXlvvVQ0ogxaFKdvEkjcYYH8XOp42
	 mDyNFHPDug3/UVnNEAHACyha/aDAbdPOMcIcxjiV3qBgXYRWp98wRCA0cCTI8SVy+3q61
	 /QfzZ81y+VF7rnLPm7VW2wMPlmy5+wRVRs7N4ZeLdekUWnKnFfP3d0q5u42DUSvRxIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zsxocCVV3Gc3V5qXvM+QGHSs1tq0tqhTMtVdXbFE274=;
	b=cTimwOdoty75CtbePA7HU5FP+b6rVNIjBjzFYyI4V0qp5yDqH1+tP4jlVqhiRRlzV5lL
	 TDOjs/amQJkvq+khHA0/iGGb4XWM0haaRCUo7NExyOrifCMsGMn9fZJSz6sS8wPu3csCc
	 HUkENUavnjNRRahe3IPM9JJ8Ui29SemqG5B9pcV9XR/4y82/xHGcYWMMZiRKTzOHbJuqR
	 HnfWmiS0UlZ3iScRKAwd9Jie+HTJtfz0c7b6q8OYNJW8iY1Qwo1QHOWRB1e8Hn9tdH3RX
	 0Fes5+VEjN9g79px0LCVFVw35JSRUs+e7dO409v49lvIRbeQEGFYhKsx8nJ7uE9WcBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I3A49Vq7;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9869606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9869606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I3A49Vq7
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso596647f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793898817; x=1794503617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zsxocCVV3Gc3V5qXvM+QGHSs1tq0tqhTMtVdXbFE274=;
        b=I3A49Vq7ta7dBxo9Cnz9j2TSAF54Zpd3Is/WHbVCOeVq31c5jhlWJKHyv1irMY0WJ0
         EkXoA9WH10K+xFvhzn6JG5VRyeJ1ICc2sbZGhk5MkMWi+kDs+b0hVVS3jJ9+SbMjXZtn
         iYH3N3279I7UobfpnB+BJYaDQdZdPhn3+5fjFlIZIo/4GMTOmjgjE7np9QTnxEqqvqKl
         TLHZOG+nA/x+5h2i/z7CdACqbA//7yKjRy9/ezohF5ALZL9SonUgWavrq6NkKVeqpawO
         4/iTzZb7ZSp3gAIzv5jm8lgoQMLTxYWukIt5vyZB0wkGr9GlreeYZBA6R15OLaNKLVDh
         +cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898817; x=1794503617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zsxocCVV3Gc3V5qXvM+QGHSs1tq0tqhTMtVdXbFE274=;
        b=tFQjTtV3LGvoRNflMDLH4/yK3NdcjThg8WH/O803F7MVd49tI3WEBbq+D3+3teaenk
         0kzDZhEaGkgBCCCvySQPiryHzhWHkyP7g80O0U/yM0N7dDvPps9U2kOIVlUqSjQrno8f
         YBJStDWwNqL5xGncwCLV2CHggzHrKEDRd7C3T3++VbQ2BALZOeb2jIqwyXoSy0oXSKdf
         Xjkn5NJWTBFZ5jqeUPrQ1DqS742asLzvMOIlUDvotTWtIKzOnuCUgV7XgbunUVYcIc28
         FzF7vwZxGleAJ7s85rc5KpidedZnrARCA67wI2o2J3KaaBUE4HkEtsTJ50YSN52Twb+8
         UOVw==
X-Forwarded-Encrypted: i=1; AKwUvByR8sCu1wGiVM7FBQYcSGrFcwuhKcubcVRTiqAIKYF+rnaFWrhnfvCrIQADoVUqjkHQAxWuRWXhEkFtkUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6rv4JHvPvZ780+XE4u0eKxc3lSgacPK7EfqbDyERrTtQY6nkD
	bNCAyhEnKjwszpJUsDCHgIFeZLC3cgaSRlr/BkIzJBPnqPxqYZLCsOYRH1HoHx+qSUk=
X-Gm-Gg: AYBFou3Ev2Jrcd9Rr5ZOI/wk058kntCG0I98Q4h40BcKN0/MPacF5s7zS5uG3oD335t
	toYL7GJfaKqXtnAFE5yZDF6vg630/SD9dQ3mWPdTzNUQU/Lg7oYq3GBk9d5vMM5xD+TjzkPA2V8
	kYl/BoIFjzjzoTjBlXYZMmxGYgRpCLIU+COzulooN859LwjC9B0liKMe/72Oce/58dUp9Vm4Gsr
	kCEIfTAatnLpR4grOOZd2LnQ0K0WX3Tpeev6vtc/YfQxk+BgUscYoxrGLhwvQR9QESSBITNdZY0
	4yEEhqmBQNWbAWLshBlF9U6vGps8/NbDAjFoNdIMNaKLmP7tdk3A5vmpDZjtFv48Qu+yoLlJF+3
	/cyAX6aCNNFz9cvOgnIhXYaUxCoc+ziC35lIJI/cAPDJoH/UtRkiIJs0CrmbjwNFUhkkhV77jiv
	kTK7mrmrzA3vwqMfiHmo4YYR9q5neA+3QSoDp1s7R1QGG/Mjrg9I3aFfUFKk04kobHXEIiKjt2b
	9fGHCOPJMljwK8HbqGciN3ISWZ3MJKbdh3fd8duAmdK32khHgn6pzvSwQY2xOEyrdLLaqr+5l/A
	thyK4mpZCEilGmgR77kHC/z9eKAqlA==
X-Received: by 2002:a05:6000:2405:b0:48e:20ed:d5e7 with SMTP id ffacd0b85a97d-49275a2671bmr503064f8f.34.1793898817202;
        Thu, 05 Nov 2026 09:13:37 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed551dbasm10705073f8f.37.2026.11.05.09.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:13:36 -0800 (PST)
Date: Thu, 5 Nov 2026 18:13:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: Chris Down <chris@chrisdown.name>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 13/16] printk: Try to register each console as Braille
 first
Message-ID: <auy5PhQ1eCdg8Ndw@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-14-pmladek@suse.com>
 <auLzFtLAUEYKvXIO@chrisdown.name>
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
In-Reply-To: <auLzFtLAUEYKvXIO@chrisdown.name>

On Thu 2026-10-29 15:17:42, Chris Down wrote:
> Petr Mladek writes:
> >Braille consoles are unique: they can only be enabled via the command
> >line and use the preferred console framework for initialization, yet
> >they are never added to the console_list or associated with
> >/dev/console. Because of this, the preferred_console variable remains
> >unset when only a Braille console is requested.
> 
> This also changes what happens when the same driver is wanted both ways, which 
> might be worth a sentence in the commit message.
> 
> For example:
> 
>     console=ttyS1 console=brl,ttyS0
> 
> Here we used to end up with ttyS1 as a normal console and the Braille request 
> was silently ignored. Now ttyS0 becomes the Braille console, and every later 
> register_console() from serial core goes to the Braille round and gets -ENODEV 
> from braille_register_console(), so there is no serial console at all.

Great catch! I actually was not aware of this particular variant.
I am going to replace the "The refactoring even fixes two subtle bugs:"
section with the following:

<paste>
Behavior change:

1. The Braille console driver is newly always preferred even when different
   serial ports are preferred. For example, let's have the following
   command lines:

     a) console=ttyS1,115200     console=brl,ttyS0,115200
     b) console=00:00:0.0,115200 console=brl,ttyS0,115200
     c) console=brl,ttyS0,115200 console=ttyS1,115200

   They all create two entries in preferred_consoles[] because:

     a) and c) differ in @index (0 vs. 1).
     b) defines either @name or @devname.

   But the original code registers:

     a) ttyS1 as normal console because it is the 1st entry in
	preferred_consoles[].

     b) ttyS0 are Braille console because the generic "ttyS" driver
	is registered early in univ8250_console_init(). The @devname
	entry is resolved too late when serial8250_init()
	registers all found devices, it assigns "tty0" for
	the given "00:00:0.0" but it is already in use.

      c) ttyS0 as Braille console because it is the 1st entry in
	 preferred_consoles[].

    The new code would register ttyS0 as the Braille console in
    all three variants because try_enable_braille_console() is
    called 1st.

2. When only the Braille console is defined on the command line,
   the original code might attempt to enable the same console twice.
   One as a default and once as a Braille console. This results in calling
   the setup() callback twice and incorrectly setting the CON_CONSDEV flag.

The 1st change makes the behavior more consistent and understandable.
The 2nd change is an obvious bug fix.
</paste>

> I think this is probably fine, but just needs clarifying in the commit message.
> 
> >+		 * @try_only_braille and @user_specifified define which
> 
> -> @user_specified

Done.

> >@@ -4033,6 +4061,24 @@ static int try_enable_console(struct console *newcon)
> > {
> > 	int err;
> > 
> >+	/*
> >+	 * First, try to enable the console driver as a Braille console.
> >+	 * It would have metadata in the preferred_consoles[] array.
> >+	 * But it won't be counted as @preferred_console because
> 
> "@preferred_console" is preferred_dev_console now, and it is a variable rather 
> than a parameter, so no "@".
> 
> With those:
> 
> Acked-by: Chris Down <chris@chrisdown.name>

I am going to add this "Acked-by" even when the change in the commit
message is a bit bigger. But I believe that it is more correct now
and it is "just a commit message". I do not want to force you to
review the patch thoughtfully again.

Best Regards,
Petr
